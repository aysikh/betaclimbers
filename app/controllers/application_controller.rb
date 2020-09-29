class ApplicationController < ActionController::Base

  helper_method :current_user, :current_username

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def current_username
    current_user.username
  end

  def get_current_events
    sample_climbers = []
    while sample_climbers.count < 3
      Cimber.all.each do |climber|
        if climber.routes.any?
          sample_climbers.push(climber)
        end
      end
    end
    return sample_climbers
  end



end
