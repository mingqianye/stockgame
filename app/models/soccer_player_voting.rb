class SoccerPlayerVoting < ApplicationRecord
  serialize :votes, Array

  def self.get
    SoccerPlayerVoting.first || SoccerPlayerVoting.new(votes: [0,0,0,0,0,0,0,0])
  end
end
