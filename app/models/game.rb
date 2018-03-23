class Game < ApplicationRecord
  has_many :operations
  belongs_to :player
end
