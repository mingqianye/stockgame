class LeaderboardController < ApplicationController
  def show
    render json: LeaderboardService.get
  end
end
