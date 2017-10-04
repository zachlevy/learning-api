class ChallengesController < AdminController
  before_action :set_challenge, only: [:show, :update, :destroy]

  # GET /admin/challenges
  def index
    @challenges = Challenge.all
    render json: @challenges
  end

  # GET /admin/challenges/1
  def show
    render json: @challenge
  end

  # POST /admin/challenges
  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      render json: @challenge, status: :created, location: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/challenges/1
  def update
    if @challenge.update(challenge_params)
      render json: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/challenges/1
  def destroy
    @challenge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      strong_params = params.require(:challenge).permit(:description, :challenge_type_id, {:body => {}}, {:dependencies => []}, {:tags => []})
      # merge strong params because rails doesn't have arrays of arrays in strong params yet
      # https://github.com/rails/rails/pull/23650
      strong_params = strong_params.to_hash.deep_merge({
        "body" => {
          "options" => params["challenge"]["body"]["options"]
        }
      }) if !params["challenge"]["body"].nil? && !params["challenge"]["body"]["options"].nil?
      strong_params
    end
end
