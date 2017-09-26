class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_user_or_anonymous_user
    if !request.headers["Authorization"].nil?
      # authenticate normally
      authenticate_user
    elsif !request.headers["AnonymousUser"].nil?
      # authenticate_anonymous_user
      # do nothing
    else
      authenticate_user # fails
    end
  end

  def current_user_or_anonymous_user
    if !request.headers["Authorization"].nil?
      return current_user
    elsif !request.headers["AnonymousUser"].nil?
      user = AnonymousUser.find(request.headers["AnonymousUser"])
      return user
    else
      return nil
    end
  end
end
