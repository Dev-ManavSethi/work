# frozen_string_literal: true

class SectionsController < ApplicationController

  before_action :CheckUserLoggedIn, only: [:show]
  before_action :CheckAdminLoggedIn, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def create
    @section = Section.new(get_params)
    redirect_to sections_path if @section.save
    render :new if @sections.errors.any?
  end

  def new
    @section = Section.new
  end

  def edit
  end

  def show
    @section = Section.find_by(id:params[:id].to_i)
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
