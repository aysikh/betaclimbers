class ApplicationController < ActionController::Base

  helper_method :current_user, :current_username, :get_current_events

  def current_user
    user_session = Climber.find(session[:climber_id])
    if user_session == nil
      redirect_to '/'
    else
      return user_session
    end
  end

  def current_username
    current_user.username
  end

  def get_current_events
    sample_climbers = {}
    Climber.all.sample(4).each do |climber|
      sample_climbers[climber.name] = []
      climber.routes.each do |route|
        sample_climbers[climber.name] << route.name
      end
    end
    return sample_climbers
  end


end
