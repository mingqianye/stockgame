class AbilitiesController < ApplicationController
  def show
    render json: AbilitiesService.get(game_id: ability_params.fetch(:game_id))
  end

  private
  def ability_params
    params.permit(:game_id, :open_id)
  end
end
