class CoursesController < ApplicationController
  before_action :authenticate_user_or_anonymous_user, only: [:attempts]
  before_action :set_course, only: [:show]

  # GET /courses
  def index
    # order newest first by default
    @courses = Course.all.order(:id).reverse_order


    # preserve order from ids param
    # https://stackoverflow.com/questions/10150152/find-model-records-by-id-in-the-order-the-array-of-ids-were-given
    unless params[:ids].nil?
      ids = params[:ids].split(",").map(&:to_i)
      indexed_courses = @courses.where(id: ids).index_by(&:id)
      @courses = ids.map { |id| indexed_courses[id] }
    end

    render json: @courses
  end

  # GET /courses/attempts
  # returns an array of course ids that the user has attempted
  # [1, 2, 3]
  def attempts
    @course_ids = current_user_or_anonymous_user.challenge_responses.select(:course_id).group(:course_id).map(&:course_id).compact

    render json: @course_ids
  end

  # GET /courses/1
  def show
    render json: @course
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
end
