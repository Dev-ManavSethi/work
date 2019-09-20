# frozen_string_literal: true

class DepartmentsController < ApplicationController
  
  before_action :CheckUserLoggedIn, only: [:show]
  before_action :CheckAdminLoggedIn, only: [:new, :create, :edit, :update, :destroy]
  
  def index
  end

  def show
    @department = Department.find(params[:id].to_i)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(get_params)

    if @department.save
      redirect_to department_path(@department)
    else
      render :new
    end

  end

  def edit
    @department = Department.find(params[:id].to_i)
  end

  def update
    @department = Department.find(params[:id].to_i)

    if @department.update(get_params)
      redirect_to department_path(@department)
    else render :edit
    end
  end

  def destroy
    @department = Department.find(params[:id].to_i)

    if @department.destroy
      #flash "Destroyed"
      redirect_to department_path
    else render :index
    end
  end

  private

  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end
end
