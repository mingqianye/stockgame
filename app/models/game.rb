class Game < ApplicationRecord
  has_many   :operations
  has_many   :ticks, through: :operations
  belongs_to :player

  def similar_games
    Game.where(tushare_code: self.tushare_code,
           num_points:   self.num_points,
           ktype:        self.ktype)
        .where("DATE(start_date) = ?", self.start_date)
  end
end
