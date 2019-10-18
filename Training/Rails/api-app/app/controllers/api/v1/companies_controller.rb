module Api
  module V1
    class CompaniesController < ApplicationController
      def index
      end

      def show
      end

        def create
          
          status = 0
          message = ""
          data = nil

          name = params[:name]

          uuid = UUID.new
          key = uuid.generate
          
          company = Company.new(name:name, key:key)
          
          if company.save
            api_key = ApiKey.new(key: key, company_id: company.id)
            
            if api_key.save
              status = 201
              message = "Company signup success"
              data = company

            elsif !api_key.save
              status = 500
              message = api_key.errors.full_messages[0]
              data = nil
            end

          elsif !company.save
            message = company.errors.full_messages[0]
            case message
            when "Name has already been taken"
              status = 400
              data = nil
            else 
              status = 500
              data = nil
            end
          end

          API_respond(status, message, data)
        end

      def update
      end

      def destroy
      end
    end
  end
end
