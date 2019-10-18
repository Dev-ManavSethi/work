module Api
    module V1
        class DepartmentsController < ApplicationController
            before_action :authenticate_api_access_token, only: [:index, :show]
            before_action :authenticate_api_modify_token, only: [:create, :update, :destroy]
  
        def index
          departments = Department.all
          response = APIresponse.new

          response.status = 200
          response.message = "List of all Departments"
          response.data = departments
          
          render json: response.to_json, status: response.status
        end
  
        def show
          response = APIresponse.new
          department = Department.find_by(id: params[:id].to_i)

          status = 0
          message = ""
          data = nil

          if department!=nil
            status = 200
            message = "Department found"
            data = department
          elsif department==nil
            status = 404
            message = "Department not found with given ID"
            data = nil
          end

          response.status = status
          response.message = message
          response.data = data

          render json: response.to_json, status: response.status
        end
  
        def create
          response = APIresponse.new
          department = Department.new(params[:department])
          status = 0
          message = ""
          data = nil

          if department.save
            status = 201
            message = "Department created"
            data = department

          elsif !department.save
            status = 500
            message = department.errors.full_messages[0]
            data = nil
          end
          response.status = status
          response.message = message
          response.data = data

          render json: response.to_json, status: response.status
        end
  
        def update
          Department.update(params[:id], params[:department])
        end
  
        def destroy
          response = APIresponse.new
          status = 0
          
          if Department.destroy(params[:id])
            response.status = 200
            response.message = "Department deleted successfully"
            response.data = nil
          else
            response.status = 500
            response.message = "Internal Server error. cannot delete"
            response.data = nil
          end
          render json: response.to_json, status: response.status
        end
    end
end
end  