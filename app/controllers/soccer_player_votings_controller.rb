class SoccerPlayerVotingsController < ApplicationController
  def votes
    record = SoccerPlayerVoting.get
    record.votes[player_id] += 1
    record.save!

    render json: {
      rate: record.votes[player_id].to_f / record.votes.sum,
      all_vote_counts: record.votes
    }
  end

  private
  def player_id
    params.fetch(:player_id).to_i
  end
end
