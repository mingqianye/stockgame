class PlayerOperationsController < ApplicationController
  def submit
    render json: InsertGameResultService.insert!(game_params)
                                        .merge({message: 'ok'})
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
