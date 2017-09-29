class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :update, :destroy]

  # GET /challenges
  def index
    @challenges = Challenge.all
    @challenges = @challenges.where(id: params[:ids].split(",")) unless params[:ids].nil?
    
    render json: @challenges
  end

  # GET /challenges/1
  def show
    # whitelist relations to be nested in response
    whitelist_methods = [:challenge_type]
    methods = []
    methods = params[:include].split(",").map {|m| m.to_sym}.reject {|m| !whitelist_methods.include? m} unless params[:include].nil?
    render json: @challenge.as_json(methods: methods)
  end

  # POST /challenges
  def create
    @challenge = Challenge.new(challenge_params)

    # skip strong params because rails doesn't have arrays of arrays in strong params yet
    # https://github.com/rails/rails/pull/23650
    @challenge.body[:options] = params[:challenge][:body][:options] unless params[:challenge][:body].nil?

    if @challenge.save
      render json: @challenge, status: :created, location: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenges/1
  def update

    # skip strong params because rails doesn't have arrays of arrays in strong params yet
    # https://github.com/rails/rails/pull/23650
    @challenge.body[:options] = params[:challenge][:body][:options] unless params[:challenge][:body].nil?

    if @challenge.update(challenge_params)
      render json: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /challenges/1
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
      params.require(:challenge).permit(:description, :challenge_type_id, {:body => {}}, {:dependencies => []}, {:tags => []})
    end
end
