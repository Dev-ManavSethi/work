# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #define error responses on invalid requests
  def error
    render status_code.to_s, status: (params[:code] || 500)
  end

  def authenticate_api_access_token
    token = params[:auth]
    if token == ENV["API_ACCESS_TOKEN"]
    else respond_to :json
      message = "Invalid auth token"
      render json: message
    end
  end

    def authenticate_api_modify_token
      token = params[:auth]
      if token == ENV["API_MODIFY_TOKEN"]
      else respond_to :json
        message = "Invalid auth token"
        render json: message
      end
    end
end
