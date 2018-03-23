class MainController < ApplicationController
  def index
    render json: {
      ticks:      Tick.count,
      games:      Game.count,
      players:    Player.count,
      operations: Operation.count
    }
  end
end
