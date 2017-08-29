class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show, :update, :destroy]

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

    if @definition.save
      render json: @definition, status: :created, location: @definition
    else
      render json: @definition.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /definitions/1
  def update
    if @definition.update(definition_params)
      render json: @definition
    else
      render json: @definition.errors, status: :unprocessable_entity
    end
  end

  # DELETE /definitions/1
  def destroy
    @definition.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def definition_params
      params.require(:definition).permit(:body, :word, :definitions)
    end
end