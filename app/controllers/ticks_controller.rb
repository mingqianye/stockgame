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

  def find_tushare_codes
    result = FilterTicksQuery.find_valid_tushare_codes(
      min_num_points: tushare_codes_search_params.fetch(:min_num_points).to_i,
      ktype:          tushare_codes_search_params.fetch(:ktype),
      start_date:     tushare_codes_search_params.fetch(:start_date)
    )

    render json: {tushare_codes: result}
  end

private
  def tick_params
    @tick_params ||= params.permit(:tushare_code, :num_points, :ktype, :start_date)
  end

  def tushare_codes_search_params
    @tushare_codes_search_params ||= params.permit(:min_num_points, :ktype, :start_date)
  end
end
