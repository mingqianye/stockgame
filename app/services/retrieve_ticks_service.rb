class RetrieveTicksService
  def self.retrieve(tushare_code: '600000', num_points: 90, ktype: 'D', start_date: 1.year.ago)
    ticks = FilterTicksQuery.filter(tushare_code: tushare_code,
                                    num_points:   num_points,
                                    ktype:        ktype,
                                    start_date:   start_date)
    return {} if ticks.count == 0

    {
      tushare_code: ticks.tushare_code,
      share_name:   ticks.share_name,
      points:       ticks.map{|x| tick_to_json(x)},
    }
  end

  def self.tick_to_json(tick)
    {
      date:   tick.date.strftime("%F"),
      open:   tick.open,
      close:  tick.close,
      high:   tick.high,
      low:    tick.low,
      volume: tick.volume
    }
  end
end
