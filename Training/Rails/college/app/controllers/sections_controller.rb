class SectionsController < ActionController

  def index
    render 'sections/index'
  end

  def create
    @section = Section.new(get_params)
    @section.save
    redirect_to
  end

  def new
    render 'sections/new'
  end

  def edit
    render 'sections/edit'
  end

  def show
    render 'sections/show'
  end

  def update
  end

  def destroy
  end

  private

  def get_params
    params.require(:section).permit(:id, :departments_id, :teachers_id)
  end

end
