class LeaderboardService
  def self.get
    games = LeaderboardQuery.top_10_games
    { ranks: ranks(games) }
  end

  def self.get_game(tushare_code:, num_points:, ktype:, start_date:)
    games = LeaderboardQuery.top_10_games_for(
      tushare_code: tushare_code,
      num_points:   num_points,
      ktype:        ktype,
      start_date:   start_date
    )

    return {} if games.blank?

    {
      share_name:   games.first.ticks.first.share_name,
      tushare_code: games.first.ticks.first.tushare_code,
      ranks:        ranks(games)
    }
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
