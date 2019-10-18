# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # before_action :allow_cors

  APIresponse = Struct.new(:status, :message ,:data)

  
  protect_from_forgery with: :null_session

  #define error responses on invalid requests
  def error
    render status_code.to_s, status: (params[:code] || 500)
  end

  def authenticate_api_access_token
    token = params[:auth]
    if token == ENV["API_ACCESS_TOKEN"]
    else respond_to :json
      message = "Invalid resource access token"
      render json: message
    end
  end

    def authenticate_api_modify_token
      token = params[:auth]
      if token == ENV["API_MODIFY_TOKEN"]
      else respond_to :json
        message = "Invalid resource modify token"
        render json: message
      end
    end

    # def allow_cors
    #   headers['Access-Control-Allow-Origin'] = 'http://localhost'
    #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    #   headers['Access-Control-Request-Method'] = '*'
    #   headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    #   headers['Access-Control-Allow-Credentials'] = true
    # end
end
