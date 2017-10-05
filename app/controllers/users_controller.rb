class UsersController < ApplicationController
  before_action :authenticate_user, only: [:get_me]

  # GET /users/me
  def get_me
    @user = current_user
    render json: @user, only: [:id, :email, :admin]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created # , location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
