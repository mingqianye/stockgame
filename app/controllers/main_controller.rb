class MainController < ApplicationController
  def index
    render json: {count: Tick.count}
  end
end
