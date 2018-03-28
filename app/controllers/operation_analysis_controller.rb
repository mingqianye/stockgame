class OperationAnalysisController < ApplicationController
  def show
    render json: OperationAnalysisService.get(
      game_id: analysis_params.fetch(:game_id),
      open_id: analysis_params.fetch(:open_id)
    )
  end

  def analysis_params
    @p ||= params.permit(:game_id, :open_id)
  end
end
