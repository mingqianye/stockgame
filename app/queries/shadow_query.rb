class ShadowQuery
  def self.shadow_games_for(tushare_code:, num_points:, ktype:, start_date:, open_id:)
    game_ids = Game.joins(:player)
                   .where(tushare_code: tushare_code,
                          num_points:   num_points,
                          ktype:        ktype)
                   .where('DATE(start_date) = ?', start_date)
                   .where('players.open_id <> ?', open_id)
                   .group('players.id')
                   .pluck('MAX(games.id)')

    Game.includes(:player)
        .includes(:ticks)
        .includes(:operations)
        .where(id: game_ids)
  end
end
