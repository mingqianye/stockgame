class TicksController < ApplicationController
  def show
    render json: RetrieveTicksService.retrieve
  end
end
