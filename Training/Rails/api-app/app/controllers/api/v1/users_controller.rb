module Api
    module V1
class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
    response = APIresponse.new

    if !params[:api_key].present?
      response.status = 401
      response.message = "API key not provided"
      response.data = nil

    elsif params[:api_key].present?
    api_key = params[:api_key]

    if api_key == ""
      response.status = 401
      response.message = "Empty API key"
      response.data = nil

    elsif api_key!=""
    company = Company.find_by(key:api_key)

    if company == nil
      response.status = 401
      response.message = "Invalid API key"
      response.data = nil

    elsif company!= nil
      auth_type = params[:auth_type]

      case auth_type
      when "access"
        user = User.new(get_user_params)

        if user.save
          uuid = UUID.new
          key = uuid.generate

          access_key = AccessToken.new(company_id: company.id, user_id:user.id, access_token: key)

          if access_key.save
            response.status = 201
            response.message = "User created"
            access_creds = {:access_token => access_key.access_token}
            response.data = [user, access_creds.to_json]


          elsif !access_key.save
            response.status = 500
            response.message = access_key.errors.full_messages[0]
            response.data = nil
          end



        elsif !user.save
          response.status = 500
          response.message = user.errors.full_messages[0]
          response.data = nil
        end
      when "auth"
        user = User.new(get_user_params)

        if user.save
          uuid = UUID.new
          key = uuid.generate

          auth_key = AuthToken.new(company_id: company.id, user_id:user.id, auth_token: key)

          if auth_key.save
            response.status = 201
            response.message = "User created"
            auth_creds = {:auth_token => auth_key.auth_token}
            response.data = [user, auth_creds.to_json]


          elsif !auth_key.save
            response.status = 500
            response.message = auth_key.errors.full_messages[0]
            response.data = nil
          end



        elsif !user.save
          response.status = 500
          response.message = user.errors.full_messages[0]
          response.data = nil
        end
      when ""
        response.status = 400
        response.message = "Auth type not provided"
        response.data = nil
      else
        response.status = 400
        response.message = "Invalid auth_type"
        response.data = nil
      end

    end
  end
end
render json: response.to_json, status: response.status
end

  def update
  end

  def destroy
  end

  private
  def get_user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end
end
end
