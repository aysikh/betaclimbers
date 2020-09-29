class ApplicationController < ActionController::Base

  helper_method :current_user, :current_username

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def current_username
    current_user.username
  end

  



end
