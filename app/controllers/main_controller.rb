class MainController < ApplicationController
  def index
    render json: {count: 0}
  end
end
