class PlayerOperationsController < ApplicationController
  def submit
    render json: { 
      message: InsertPlayerOperationService.insert!(game_params)
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
      operations: [:operation_type, :point_index, :operated_at]
    )
  end
end
