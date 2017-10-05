class Admin::UsersController < AdminController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /admin/users
  def index
    @users = User.all.order(id: :desc)

    render json: @users
  end

  # GET /admin/users/1
  def show
    render json: @user
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
