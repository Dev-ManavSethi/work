class CompaniesController < ApplicationController
  def index
  end

  def show
  end

  def create
    name = params[:name]

    uuid = UUID.new
    key = uuid.generate

    company = Company.new(name:name, key:key)
    response = APIresponse.new

    if company.save

      api_key = ApiKey.new(key: key, company_id: company.id)
      if api_key.save
        response.status = 201
        response.message = "Company signup success"
        response.data = company

      elsif !api_key.save
        response.status = 500
        response.message = api_key.errors.full_messages
        response.data = nil
      end
    elsif !company.save
      response.status = 500
      response.message = company.errors.full_messages
      response.data = nil
    end


    render json: response.to_json, status: response.status
  end

  def update
  end

  def destroy
  end
end
