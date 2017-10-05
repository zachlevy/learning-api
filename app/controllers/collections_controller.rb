class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  # GET /collections
  def index
    @collections = Collection.all

    render json: @collections
  end

  # GET /collections/1
  def show
    render json: @collection
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.friendly.find(params[:id])
    end
end
