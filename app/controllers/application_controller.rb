class ApplicationController < ActionController::API
  rescue_from Exception do |exception|
    render json: {
      exception: exception,
      status: 500
    }
  end
end
