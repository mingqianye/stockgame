class ShadowsController < ApplicationController
  def show
    render json: ShadowsService.find_shadows(
      tushare_code: shadows_params.fetch(:tushare_code).to_s,
      num_points:   shadows_params.fetch(:num_points).to_i,
      ktype:        shadows_params.fetch(:ktype),
      start_date:   shadows_params.fetch(:start_date),
      open_id:      shadows_params.fetch(:open_id)
    )
  end

private
  def shadows_params
    @shadows_params ||= params.permit(:tushare_code, :num_points, :ktype, :start_date, :open_id)
  end
end
