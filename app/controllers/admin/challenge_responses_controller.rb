class ChallengeResponsesController < AdminController
  before_action :set_challenge_response, only: [:show, :update, :destroy]

  # GET /admin/challenge_responses
  def index
    @challenge_responses = ChallengeResponse.all
    render json: @challenge_responses
  end

  # GET /admin/challenge_responses/1
  def show
    render json: @challenge_response
  end

  # POST /admin/challenge_responses
  def create
    @challenge_response = ChallengeResponse.new(challenge_response_params)
      render json: @challenge_response, status: :created, location: @challenge_response
    else
      render json: @challenge_response.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/challenge_responses/1
  def update
    if @challenge_response.update(challenge_response_params)
      render json: @challenge_response
    else
      render json: @challenge_response.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/challenge_responses/1
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
      params.require(:challenge_response).permit({:input => {}}, :asked_at, :completed_at, :challenge_id, :user_id, :course_id, :status, :anonymous_user_id)
    end
end
