class LeaderboardQuery
  def self.top_10_games
    Game.includes(:player).order(portfolio_value: :desc).limit(10)
  end

  def self.top_10_games_for(tushare_code:, num_points:, ktype:, start_date:)
    Game.includes(:player)
        .includes(:ticks)
        .where(tushare_code: tushare_code,
               num_points:   num_points,
               ktype:        ktype)
        .where("DATE(start_date) = ?", start_date)
        .order(portfolio_value: :desc)
        .limit(10)
  end
end
