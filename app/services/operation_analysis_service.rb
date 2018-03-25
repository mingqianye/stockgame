class OperationAnalysisService
  def self.get(tushare_code:, num_points:, ktype:, start_date:, open_id:)
    counts = PlayerOperationsQuery.count_op_types_for(
      tushare_code: tushare_code,
      num_points: num_points,
      ktype: ktype,
      start_date: start_date
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
