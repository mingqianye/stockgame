class OperationAnalysisService
  def self.get(game_id:, open_id:)
    counts = PlayerOperationsQuery.count_op_types_for(game_id: game_id)

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
