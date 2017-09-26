class FeedbacksController < ApplicationController
  before_action :authenticate_user_or_anonymous_user, only: [:create]
  before_action :set_feedback, only: [:show, :update, :destroy]

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all

    render json: @feedbacks
  end

  # GET /feedbacks/1
  def show
    render json: @feedback
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)

    user = current_user_or_anonymous_user
    if user.class.to_s == "User" && !user.nil?
      @feedback.body["user_id"] = user.id
    end
    if user.class.to_s == "AnonymousUser" && !user.nil?
      @feedback.body["anonymous_user_id"] = user.id
    end

    if @feedback.save
      render json: @feedback, status: :created, location: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feedbacks/1
  def update
    if @feedback.update(feedback_params)
      render json: @feedback
    else
      render json: @feedback.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feedbacks/1
  def destroy
    @feedback.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit({:body => {}}, :source)
    end
end
