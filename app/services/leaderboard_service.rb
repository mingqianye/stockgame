class LeaderboardService
  def self.get
    games = LeaderboardQuery.top_10_games
    { ranks: ranks(games) }
  end

  def self.ranks(games)
    result = []
    games.each_with_index do |game, i|
      result << {
        rank:          i + 1,
        open_id:       game.player.open_id,
        nick_name:     game.player.nick_name,
        profitability: game.portfolio_value - 1
      }
    end
    result
  end
end
