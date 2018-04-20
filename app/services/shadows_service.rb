class ShadowsService
  def self.find_shadows(tushare_code:, num_points:, ktype:, start_date:, open_id:)
    games = ShadowQuery.shadow_games_for(
      tushare_code: tushare_code,
      num_points:   num_points,
      ktype:        ktype,
      start_date:   start_date,
      open_id:      open_id)
    ).sample(4)

    {
      other_players: games.map{|x| process_game(x)}
    }
  end

  def self.process_game(game)
    {
      game_id:         game.id,
      nick_name:       game.player.nick_name,
      avatar_url:      game.player.avatar_url,
      profitabilities: profitabilities(ops: game.operations)
    }
  end

  # Given an array of operations, return an array of portfolios
  def self.profitabilities(ops:)
    result = []
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
      result << p.total(price: op.tick.close)
    end
    result
  end
end
