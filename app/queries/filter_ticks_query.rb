class FilterTicksQuery
  def self.filter(tushare_code: '600000', num_points: 90, ktype: 'D', start_date: 1.year.ago)
    Tick.where(tushare_code: tushare_code,
               ktype: ktype)
        .where("date >= ?", start_date)
        .order('date')
        .limit(num_points)
  end
end
