class AbilityQuery
  def self.rank_for(game_id:)
    game = Game.find(game_id)

    # find the rank of this game_id
    Game.where(tushare_code: game.tushare_code,
               num_points:   game.num_points,
               ktype:        game.ktype)
        .where("DATE(start_date) = ?", game.start_date.to_date)
        .order(portfolio_value: :desc)
        .pluck(:id)
        .each_with_index do |id, i|
          return i + 1 if id == game.id
        end
  end

end
