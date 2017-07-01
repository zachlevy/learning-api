class CourseContentsController < ApplicationController
  before_action :set_course_content, only: [:show, :update, :destroy]

  # GET /course_contents
  def index
    @course_contents = CourseContent.all

    render json: @course_contents
  end

  # GET /course_contents/1
  def show
    render json: @course_content
  end

  # POST /course_contents
  def create
    @course_content = CourseContent.new(course_content_params)

    if @course_content.save
      render json: @course_content, status: :created, location: @course_content
    else
      render json: @course_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /course_contents/1
  def update
    if @course_content.update(course_content_params)
      render json: @course_content
    else
      render json: @course_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /course_contents/1
  def destroy
    @course_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_content
      @course_content = CourseContent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_content_params
      params.require(:course_content).permit(:course_id, :content_id)
    end
end
