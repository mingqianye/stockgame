class OperationAnalysisService
  def self.get(game_id:, open_id:)
    game = Game.find(game_id)

    counts = PlayerOperationsQuery.count_op_types_for(
      tushare_code: game.tushare_code,
      num_points:   game.num_points,
      ktype:        game.ktype,
      start_date:   game.start_date
    )

    {
      stats: counts.map{|x| format(x)}
    }
  end

  def self.format(count_hash)
    {
      num_buyers:  count_hash.fetch('bought', 0),
      num_sellers: count_hash.fetch('sold', 0),
      num_noopers: count_hash.fetch('noop', 0),
      tick_id:     count_hash.fetch('tick_id')
    }
  end
end
