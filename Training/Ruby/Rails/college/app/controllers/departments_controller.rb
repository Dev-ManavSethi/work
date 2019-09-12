class DepartmentsController < ActionController::Base
  def index
    render 'departments/index'
  end

  def create
    @department = Department.new(get_params)
    @department.save
    redirect_to article
  end

  def new
    render 'departments/new'
  end

  def edit
    render 'departments/edit'
  end

  def show
    render 'departments/show'
  end

  def update
  end

  def destroy
  end



  private

  def get_params
    params.require(:department).permit(:id, :name, :teachers_id)
  end

end
