class Operation < ApplicationRecord
  belongs_to :tick
  belongs_to :game
end
