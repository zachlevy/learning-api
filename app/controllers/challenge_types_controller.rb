class ChallengeTypesController < ApplicationController
  before_action :set_challenge_type, only: [:show]

  # GET /challenge_types
  def index
    @challenge_types = ChallengeType.all

    render json: @challenge_types
  end

  # GET /challenge_types/1
  def show
    render json: @challenge_type
  end
end
