class FilterTicksQuery
  def self.filter(tushare_code: '600000', num_points: 90, ktype: 'D', start_date: 1.year.ago)
    Tick.where(tushare_code: tushare_code,
               ktype:        ktype)
        .where("date >= ?", start_date)
        .order('date')
        .limit(num_points)
  end

  def self.find_valid_tushare_codes(min_num_points: 240, ktype: 'D', start_date: 1.year.ago)
    Tick.where(ktype: ktype)
        .where("date >= ?", start_date)
        .group(:tushare_code)
        .having("COUNT(*) > ?", min_num_points)
        .pluck(:tushare_code)
  end
end
