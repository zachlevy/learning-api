class ChallengeResponsesController < ApplicationController
  before_action :authenticate_user_or_anonymous_user, only: [:create]

  before_action :set_challenge_response, only: [:show, :update, :destroy]

  # GET /challenge_responses
  def index
    @challenge_responses = ChallengeResponse.all
    @challenge_responses = @challenge_responses.where(challenge_id: params[:challenge_ids].split(",")) unless params[:course_id].nil?
    render json: @challenge_responses
  end

  # GET /challenge_responses/1
  def show
    render json: @challenge_response
  end

  # POST /challenge_responses
  def create
    @challenge_response = ChallengeResponse.new(challenge_response_params)

    # set user
    user = current_user_or_anonymous_user
    if user.class.to_s == "User"
      @challenge_response.user = user
    end
    if user.class.to_s == "AnonymousUser"
      @challenge_response.anonymous_user = user
    end

    # save initially
    if @challenge_response.save
      if @challenge_response.input["analysis"] == "sentiment"
        analyzer = Sentimental.new
        analyzer.load_defaults
        analyzer.threshold = 0.1
        result = analyzer.sentiment(@challenge_response.input["text"])
        @challenge_response.input["result"] = result
        @challenge_response.save
      end

      render json: @challenge_response, status: :created, location: @challenge_response
    else
      render json: @challenge_response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenge_responses/1
  def update
    if @challenge_response.update(challenge_response_params)
      render json: @challenge_response
    else
      render json: @challenge_response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /challenge_responses/1
  def destroy
    @challenge_response.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_response
      @challenge_response = ChallengeResponse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_response_params
      params.require(:challenge_response).permit({:input => {}}, :asked_at, :completed_at, :challenge_id, :user_id, :course_id)
    end
end
