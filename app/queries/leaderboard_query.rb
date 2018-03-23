class LeaderboardQuery
  def self.top_10_games
    Game.includes(:player).order(portfolio_value: :desc).limit(10)
  end
end
