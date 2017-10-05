class ProfilesController < ApplicationController

  # GET /profiles/me
  def get_me
    if current_user_or_anonymous_user.nil?
      render status: 400
      return
    end
    @profile = current_user_or_anonymous_user.profile
    render json: @profile
  end

  # PUT /profiles/me
  def put_me
    if current_user_or_anonymous_user.nil?
      render status: 400
      return
    end

    @profile = current_user_or_anonymous_user.profile

    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit({:demographic => {}}, {:preferences => {}}, {:details => {}}, :user_id)
    end
end
