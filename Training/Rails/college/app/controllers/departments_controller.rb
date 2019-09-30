# frozen_string_literal: true

class DepartmentsController < ApplicationController

  
  before_action :CheckUserLoggedIn, only: [:show]
  before_action :CheckAdminLoggedIn, only: [:new, :create, :edit, :update, :destroy]
  


  @sorted_by_name = "false"
  @sorted_by_id = "true"
  @search_name = ""
  @search_hod_id = 0

  def index

    if (!params[:search_name].present? || params[:search_name]=="") && (!params[:search_hod_id].present? || params[:search_name]=="")
      @departments = Department.all.paginate(:page => params[:page], :per_page => 10).order(:id)

      if params[:sort_by_name].present?
        #@departments = Department.all.paginate(:page => params[:page], :per_page => 10).order(:name)
        @departments = sort(@departments, "name", params[:sort_by_name])
      end
      
      if params[:sort_by_id].present?
        @departments = sort(@departments, "id", params[:sort_by_id])  
      end
    end


    if params[:search_name].present? && (!params[:search_hod_id].present? || params[:search_hod_id] == "")
      @departments = Department.all.where("name ILIKE '#{params[:search_name]}%'").paginate(:page => params[:page], :per_page => 10).order(:id)

      @departments = sort(@departments, "name", params[:sort_by_name]) if params[:sort_by_name].present?
      
      @departments = sort(@departments, "id", params[:sort_by_id]) if params[:sort_by_id].present? 

      @search_name = params[:search_name]
      @search_hod_id = params[:search_hod_id]
    end

    if params[:search_hod_id].present? && (!params[:search_name].present? || params[:search_name]=="")
      @departments = Department.all.where("hod_id = '#{params[:search_hod_id]}'").paginate(:page => params[:page], :per_page => 10).order(:id)


      @departments = sort(@departments, "name", params[:sort_by_name]) if params[:sort_by_name].present?
      
      @departments = sort(@departments, "id", params[:sort_by_id]) if params[:sort_by_id].present? 
      @search_name = params[:search_name]
      @search_hod_id = params[:search_hod_id]
    end

    if params[:search_name].present? && params[:search_hod_id].present?
      @departments = Department.all.where("name ILIKE '#{params[:search_name]}%' AND hod_id = '#{params[:search_hod_id]}'").paginate(:page => params[:page], :per_page => 10).order(:id)

      @departments = sort(@departments, "name", params[:sort_by_name]) if params[:sort_by_name].present?
      
      @departments = sort(@departments, "id", params[:sort_by_id]) if params[:sort_by_id].present? 
      @search_name = params[:search_name]
      @search_hod_id = params[:search_hod_id]
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

  def sort(departments, sort_field, sort_value)

    case sort_field
    when "name"
      @sort_by_name = !@sorted_by_name
    when "id"
      @sorted_by_id = !@sorted_by_id
    end

    return departments.order("#{sort_field} ASC") if sort_value == "true"
    return departments.order("#{sort_field} DESC") if sort_value == "false"

  end

  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end
end
