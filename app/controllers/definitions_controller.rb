class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show]

  # GET /definitions
  def index
    @definitions = Definition.all

    render json: @definitions
  end

  # GET /definitions/1
  def show
    render json: @definition
  end

  # POST /definitions
  def create
    @definition = Definition.new(definition_params)

    # check to see if definition already exist and had successful response from the api
    @existing_definition = Definition.find_by(word: params[:definition][:word])
    already_defined = !@existing_definition.nil? && @existing_definition.definitions.length != 0
    if already_defined
      @definition = @existing_definition
    end

    if already_defined || @definition.save
      render json: @definition, status: :created, location: @definition
    else
      render json: @definition.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def definition_params
      params.require(:definition).permit({:body => {}}, :word, {:definitions => []})
    end
end
