class AbilitiesService
  def self.get(game_id:)
    {
      rank:  AbilityQuery.rank_for(game_id: game_id),
      radar: radar(game_id)
    }
  end

  private

  def self.radar(game_id)
    {
      long_ability:   3,
      middle_ability: 4,
      short_ability:  6,
      profit_ability: 7,
      avoid_ability:  8
    }
  end
end
