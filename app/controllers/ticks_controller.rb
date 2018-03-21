class TicksController < ApplicationController
  def show
    result = RetrieveTicksService.retrieve(
      tushare_code: tick_params.fetch(:tushare_code).to_s,
      num_points:   tick_params.fetch(:num_points).to_i,
      ktype:        tick_params.fetch(:ktype),
      start_date:   tick_params.fetch(:start_date)
    )
    render json: result
  end

private
  def tick_params
    @tick_params ||= params.permit(:tushare_code, :num_points, :ktype, :start_date)
  end
end
