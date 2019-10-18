class ApplicationController < ActionController::API
  APIresponse = Struct.new(:status, :message ,:data)
end
