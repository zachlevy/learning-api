class AdminController < ApplicationController
  before_action :authenticate_user_or_anonymous_user
  before_action :authenticate_admin

  def authenticate_admin
    if !current_user_or_anonymous_user.nil? && current_user_or_anonymous_user.admin?
      return true
    else
      render json: {
        errors: {
          user: "not an admin"
        }
      }, status: 401
      return
    end
  end
end
