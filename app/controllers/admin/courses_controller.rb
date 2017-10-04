class CoursesController < AdminController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /admin/courses
  def index
    @courses = Course.all
    render json: @courses
  end

  # GET /admin/courses/1
  def show
    render json: @course
  end

  # POST /admin/courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/courses/1
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:title, :description, :image_url, :est_duration, {:flow => [:id, :type]}, {:tags => []}, {:ui => {}})
    end
end
