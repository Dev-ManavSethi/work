class DepartmentsController < ApplicationController
  def index
    render 'departments/index'
  end

  def show
    @department = Department.find(params[:id].to_i)

    render 'departments/show'
  end

  def new
    @department = Department.new
    render 'departments/new'
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
    render 'departments/edit'
  end

  def update
    @department = Department.find(params[:id].to_i)
    if @department.update(get_params)
      redirect_to department_path(@department)
    else render "departments/edit"
    end
  end

  def destroy
    @department = Department.find(params[:id].to_i)
    if @department.destroy
      render 'departments/index'
    else puts "SORRRRRRRRRRRRRRRRRRRRRRRRRRRRRY"
    end
  end



  private

  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end

end
