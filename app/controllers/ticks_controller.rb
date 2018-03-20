class TicksController < ApplicationController
  def show
    result = RetrieveTicksService.retrieve(
      tushare_code: params[:tushare_code].to_s,
      num_points:   params[:num_points].to_i,
      ktype:        params[:ktype],
      start_date:   params[:start_date]
    )
    render json: result
  end
end
