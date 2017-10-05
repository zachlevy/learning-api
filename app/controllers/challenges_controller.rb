class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]

  # GET /challenges
  def index
    @challenges = Challenge.all
    @challenges = @challenges.where(id: params[:ids].split(",")) unless params[:ids].nil?

    # preserve order from ids param
    # https://stackoverflow.com/questions/10150152/find-model-records-by-id-in-the-order-the-array-of-ids-were-given
    unless params[:ids].nil?
      ids = params[:ids].split(",").map(&:to_i)
      indexed_challenges = @challenges.where(id: ids).index_by(&:id)
      @challenges = ids.map { |id| indexed_challenges[id] }
    end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end
end
