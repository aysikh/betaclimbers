module ClimbersHelper

  def current_user
    Climber.find(id: session[:climber_id])
  end

  def logged_in?
    current_user.nil?
  end

end
