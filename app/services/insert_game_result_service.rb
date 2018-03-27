class InsertGameResultService
  # Test this method in the console
  # InsertGameResultService.insert!({open_id: "asdf", tushare_code: "600000", ktype: "D", num_points: 10, start_date: '2017-07-01', operations: [{operation_type: 'bought', point_index: 1}, {operation_type: 'sold', point_index: 3}]})
  def self.insert!(params)
    game = nil

    Player.transaction do
      # create game
      game = Player.find_or_create_by(open_id: params.fetch(:open_id))
                   .games
                   .create!(
                     tushare_code:    params.fetch(:tushare_code),
                     ktype:           params.fetch(:ktype),
                     num_points:      params.fetch(:num_points),
                     start_date:      params.fetch(:start_date),
                     portfolio_value: -99
                   )

      # find ticks
      ticks = FilterTicksQuery.filter(
        tushare_code: params.fetch(:tushare_code),
        ktype:        params.fetch(:ktype),
        num_points:   params.fetch(:num_points),
        start_date:   params.fetch(:start_date)
      )

      # create all operations
      new_ops = new_operations(
        game_id: game.id,
        ops:     params.fetch(:operations),
        ticks:   ticks
      )

      Operation.import!(new_ops, validate: false)

      # Update Game portfolio
      game.update_attributes!(
        portfolio_value: portfolio(ops: game.operations.includes(:tick))
      )
    end

    { game_id: game.id }
  end

  def self.new_operations(game_id:, ops:, ticks:)
    # hashmap keyed by point_index; value is "bought", "sold", or "noop"
    indexed_ops = ops.reduce(Hash.new("noop")) do |total, x| 
      total.merge!(x.fetch(:point_index) => x.fetch(:operation_type))
    end

    result = []
    ticks.each_with_index do |tick, i|
      result << Operation.new(
        game_id: game_id,
        op_type: indexed_ops[i],
        tick_id: tick.id
      )
    end
    result
  end

  def self.portfolio(ops:)
    p = Portfolio.new
    ops.each do |op|
      case op.op_type
      when 'bought'
        p.bought_at(price: op.tick.close)
      when 'sold'
        p.sold_at(price: op.tick.close)
      when 'noop'
      else
        raise "Invalid operation type: #{op.op_type}"
      end
    end
    p.total(price: ops.last.tick.close)
  end
end
