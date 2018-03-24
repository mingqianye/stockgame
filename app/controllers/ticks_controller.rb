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
    ).select{|x| popular_tushare_codes.include?(x)}

    render json: {tushare_codes: result}
  end

private
  def tick_params
    @tick_params ||= params.permit(:tushare_code, :num_points, :ktype, :start_date)
  end

  def tushare_codes_search_params
    @tushare_codes_search_params ||= params.permit(:min_num_points, :ktype, :start_date)
  end

  def popular_tushare_codes
    %w(000418 000420 000423 000426 000429 000430 000488 000505 000525 000528 000538 000540 000546 000554 000560 000567 000568 000581 600009 600016 600017 600018 600019 600031 600050 600056 600058 600059 600060 600061 600066 600067 600083 600085 600096 600104 600111 600121 600123 600125 600129 600132 600138 600168 600183 600184 600192 600195 600209 600210 600213 600215 600216 600219 600220 600252 600255 600256 600267 600269 600271)
  end
end
