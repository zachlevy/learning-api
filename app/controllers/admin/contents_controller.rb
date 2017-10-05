class Admin::ContentsController < AdminController
  before_action :set_content, only: [:show, :update, :destroy]

  # GET /admin/contents
  def index
    @contents = Content.all

    render json: @contents
  end

  # GET /admin/contents/1
  def show
    render json: @content
  end

  # POST /admin/contents
  def create
    @content = Content.new(content_params)

    if @content.save
      render json: @content, status: :created, location: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/contents/1
  def update
    if @content.update(content_params)
      render json: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/contents/1
  def destroy
    @content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def content_params
      params.require(:content).permit(:title, :embed_url, :est_duration)
    end
end
