# frozen_string_literal: true

class DepartmentsController < ApplicationController

  
  before_action :CheckUserLoggedIn, only: [:show]
  before_action :CheckAdminLoggedIn, only: [:new, :create, :edit, :update, :destroy]
  


  @sorted_by_name = false
  @sorted_by_id = true
  @search_name = ""
  @search_hod_id = 0

  def index
    @departments = Department.all

    if params[:sort_by_name].present?

      if params[:sort_by_name] == "true"
        @sorted_by_name = true
        @sorted_by_id = false
        @departments = @departments.order(:name)
        
      elsif params[:sort_by_name] == "false"
        @sorted_by_name = false
        @sorted_by_id = false
        @departments = @departments.order("name DESC")
      end

    end

    if params[:sort_by_id].present?

      if params[:sort_by_id] == "true"
        @sorted_by_id = true
        @sorted_by_name = false
        @departments = @departments.order(:id)
        
      elsif params[:sort_by_id] == "false"
        @sorted_by_id = false
        @sorted_by_name = false
        @departments = @departments.order("id DESC")  
      end

    end

    #show all
    if (!params[:search_name].present? || params[:search_name]=="") && (!params[:search_hod_id].present? || params[:search_name]=="")
      @departments = @departments.paginate(:page => params[:page], :per_page => 10)
    end

    #search by name
    if params[:search_name].present? && (!params[:search_hod_id].present? || params[:search_hod_id] == "")

      @departments = @departments.where("name ILIKE '#{params[:search_name]}%'").paginate(:page => params[:page], :per_page => 10)

      @search_name = params[:search_name]
      @search_hod_id = params[:search_hod_id]
      
    end

    #search by id
    if params[:search_hod_id].present? && (!params[:search_name].present? || params[:search_name]=="")
      @departments = @departments.where("hod_id = '#{params[:search_hod_id]}'").paginate(:page => params[:page], :per_page => 10)

      @search_name = params[:search_name]
      @search_hod_id = params[:search_hod_id]  
    end

    #search by both
    if params[:search_name].present? && params[:search_hod_id].present?
      @departments = @departments.where("name ILIKE '#{params[:search_name]}%' AND hod_id = '#{params[:search_hod_id]}'").paginate(:page => params[:page], :per_page => 10).order(:id)

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

  def assignment
    
  end

  def get_name

      @department = Department.first
      respond_to do |format|
        format.json {
          render json: {"department" => @department}
        }
      end
  end

  private

  def sort_departments(sort_field, sort_value)

    case sort_field
    when "name"
      @sort_by_name = !@sorted_by_name
    when "id"
      @sorted_by_id = !@sorted_by_id
    end

    if sort_value == "true"
      return @departments.order("#{sort_field} ASC")
    end

    if sort_value == "false"
      return @departments.order("#{sort_field} DESC")
    end

  end

  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end
end
