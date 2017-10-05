class Admin::ChallengeTypesController < AdminController
  before_action :set_challenge_type, only: [:show, :update, :destroy]

  # GET /admin/challenge_types
  def index
    @challenge_types = ChallengeType.all

    render json: @challenge_types
  end

  # GET /admin/challenge_types/1
  def show
    render json: @challenge_type
  end

  # POST /admin/challenge_types
  def create
    @challenge_type = ChallengeType.new(challenge_type_params)

    if @challenge_type.save
      render json: @challenge_type, status: :created, location: @challenge_type
    else
      render json: @challenge_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/challenge_types/1
  def update
    if @challenge_type.update(challenge_type_params)
      render json: @challenge_type
    else
      render json: @challenge_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/challenge_types/1
  def destroy
    @challenge_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_type
      @challenge_type = ChallengeType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_type_params
      params.require(:challenge_type).permit(:name, {:template_data => {}})
    end
end
