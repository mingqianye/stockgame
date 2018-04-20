class ShadowQuery
  def self.shadow_games_for(tushare_code:, num_points:, ktype:, start_date:, open_id:)
    Game.includes(:player)
        .includes(:ticks)
        .includes(:operations)
        .where(tushare_code: tushare_code,
               num_points:   num_points,
               ktype:        ktype)
        .where("DATE(start_date) = ?", start_date)
        .where("open_id <> ?", open_id)
  end
end
