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

          if department!=nil
            response.status = 200
            response.message = "Department found"
            response.data = department
          elsif department==nil
            response.status = 404
            response.message = "Department not found with given ID"
            response.data = nil
          end
          render json: response.to_json, status: response.status
        end
  
        def create
          response = APIresponse.new
          department = Department.new(params[:department])
          if department.save
            response.status = 201
            response.message = "Department created"
            response.data = department
          elsif !department.save
            response.status = 500
            response.message = department.errors.full_messages[0]
            response.data = nil
          end
          render json: response.to_json, status: response.status
        end
  
        def update
          Department.update(params[:id], params[:department])
        end
  
        def destroy
          response = APIresponse.new
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