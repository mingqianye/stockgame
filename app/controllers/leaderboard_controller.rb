class LeaderboardController < ApplicationController
  def show
    render json: LeaderboardService.get
  end

  def show_game
    result = LeaderboardService.get_game(
      tushare_code: game_leaderboard_params.fetch(:tushare_code).to_s,
      num_points:   game_leaderboard_params.fetch(:num_points).to_i,
      ktype:        game_leaderboard_params.fetch(:ktype),
      start_date:   game_leaderboard_params.fetch(:start_date)
    )
    render json: result
  end

private
  def game_leaderboard_params
    @gl_params ||= params.permit(:tushare_code, :num_points, :ktype, :start_date)
  end
end
