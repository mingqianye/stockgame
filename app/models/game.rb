class Game < ApplicationRecord
  has_many   :operations
  has_many   :ticks, through: :operations
  belongs_to :player
end
