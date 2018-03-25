class OperationAnalysisController < ApplicationController
  def show
    render json: OperationAnalysisService.get(
      tushare_code: analysis_params.fetch(:tushare_code).to_s,
      num_points:   analysis_params.fetch(:num_points).to_i,
      ktype:        analysis_params.fetch(:ktype),
      start_date:   analysis_params.fetch(:start_date),
      open_id:      analysis_params.fetch(:open_id)
    )
  end

  def analysis_params
    @p ||= params.permit(:tushare_code, :num_points, :ktype, :start_date, :open_id)
  end
end
