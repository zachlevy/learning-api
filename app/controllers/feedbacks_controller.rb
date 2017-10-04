class FeedbacksController < ApplicationController
  before_action :authenticate_user_or_anonymous_user

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

  private
    # Only allow a trusted parameter "white list" through.
    def feedback_params
      params.require(:feedback).permit({:body => {}}, :source)
    end
end
