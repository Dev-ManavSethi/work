class ApplicationController < ActionController::API
  APIresponse = Struct.new(:status, :message ,:data)

  def API_respond(status, message, data)
    response = APIresponse.new(status:status, message:message, data:data)
    render response.to_json, status:status
  end
end
