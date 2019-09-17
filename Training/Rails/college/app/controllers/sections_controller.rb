# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    render 'sections/index'
  end

  def create
    @section = Section.new(get_params)
    redirect_to sections_path if @section.save
    render 'sections/new' if @sections.errors.any?
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

  def update; end

  def destroy; end

  private

  def get_params
    params.require(:section).permit(:id, :departments_id, :teachers_id)
  end

  def select
    render 'sections/select'
  end
end
