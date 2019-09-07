class DepartmentsController < ActionController::Base
  def index
    render 'departments/new'
  end

  def new
@department = Department.new

  end

  def add
    department = Department.new(get_params)
    department.save
    redirect_to '/success/Department+was+added+successfully'

  end

  def view

    department = Department.find(get_params)
    puts department

  end

  def edit

  end

  private

  def get_params

    params.require(:department).permit(:id, :name, :teachers_id)


  end




end
