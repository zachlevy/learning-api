class AnonymousUsersController < ApplicationController

  # POST /anonymous_users
  def create
    @anonymous_user = AnonymousUser.new(anonymous_user_params)

    if @anonymous_user.save
      render json: @anonymous_user, status: :created # , location: @anonymous_user
    else
      render json: @anonymous_user.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def anonymous_user_params
      params.fetch(:anonymous_user, {})
    end
end
