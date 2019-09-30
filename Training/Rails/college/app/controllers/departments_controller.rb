# frozen_string_literal: true

class DepartmentsController < ApplicationController

  @sorted = false
  
  before_action :CheckUserLoggedIn, only: [:show]
  before_action :CheckAdminLoggedIn, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    if !params[:sort].present?
    @departments = Department.all.order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif params[:sort].present?
      if params[:sort]=="true"
        @sorted = true
        @departments = Department.all.order(:name).paginate(:page => params[:page], :per_page => 10)
      elsif params[:sort]=="false"
        @sorted=false
        @departments = Department.all.order("name DESC").paginate(:page => params[:page], :per_page => 10)
      end

    end
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

  def search
    respond_to :json
    search_query = params[:name]
    hod_id_query = params[:hod_id]

    if search_query==''
      format.json { render json: "" }
    
    end

    @department_search_results = Department.all.where("name ILIKE '#{search_query}%' AND hod_id = #{hod_id_query}").order(:id)

    respond_to do |format|

      format.json { render json: @department_search_results }
    
     end

  
  end

  private

  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end
end
