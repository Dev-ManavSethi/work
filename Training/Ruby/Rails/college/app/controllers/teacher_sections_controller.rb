class TeacherSectionsController < ApplicationController
  before_action :set_teacher_section, only: [:show, :edit, :update, :destroy]

  # GET /teacher_sections
  # GET /teacher_sections.json
  def index
    @teacher_sections = TeacherSection.all
  end

  # GET /teacher_sections/1
  # GET /teacher_sections/1.json
  def show
  end

  # GET /teacher_sections/new
  def new
    @teacher_section = TeacherSection.new
  end

  # GET /teacher_sections/1/edit
  def edit
  end

  # POST /teacher_sections
  # POST /teacher_sections.json
  def create
    @teacher_section = TeacherSection.new(teacher_section_params)

    respond_to do |format|
      if @teacher_section.save
        format.html { redirect_to @teacher_section, notice: 'Teacher section was successfully created.' }
        format.json { render :show, status: :created, location: @teacher_section }
      else
        format.html { render :new }
        format.json { render json: @teacher_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_sections/1
  # PATCH/PUT /teacher_sections/1.json
  def update
    respond_to do |format|
      if @teacher_section.update(teacher_section_params)
        format.html { redirect_to @teacher_section, notice: 'Teacher section was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher_section }
      else
        format.html { render :edit }
        format.json { render json: @teacher_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_sections/1
  # DELETE /teacher_sections/1.json
  def destroy
    @teacher_section.destroy
    respond_to do |format|
      format.html { redirect_to teacher_sections_url, notice: 'Teacher section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_section
      @teacher_section = TeacherSection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_section_params
      params.require(:teacher_section).permit(:teacher_id, :section_id)
    end
end
