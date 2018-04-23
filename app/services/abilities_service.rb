class AbilitiesService
  def self.get(game_id:)
    game = Game.find(game_id)
    {
      rank:           AbilityQuery.rank_for(game: game),
      rate_of_return: game.portfolio_value - 1,
      radar:          radar(game_id)
    }
  end

  private

  def self.radar(game_id)
    {
      long_ability:   3 + rand(7),
      middle_ability: 3 + rand(7),
      short_ability:  3 + rand(7),
      profit_ability: 3 + rand(7),
      avoid_ability:  3 + rand(7)
    }
  end
end
