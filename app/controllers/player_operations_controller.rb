class PlayerOperationsController < ApplicationController
  def submit
    render json: { 
      message: 'ok',
      game_id: InsertGameResultService.insert!(game_params)
    }
  end

private
  def game_params
    params.permit(
      :open_id, 
      :tushare_code,
      :ktype, 
      :num_points,
      :start_date,
      operations: [:operation_type, :point_index]
    )
  end
end
