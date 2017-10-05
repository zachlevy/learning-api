class Admin::ProfilesController < AdminController
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /admin/profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /admin/profiles/1
  def show
    render json: @profile
  end

  # POST /admin/profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/profiles/1
  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/profiles/1
  def destroy
    @profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit({:demographic => {}}, {:preferences => {}}, {:details => {}}, :user_id)
    end
end
