class ApplicationController < ActionController::Base

  helper_method :current_user, :current_username, :get_the_weather

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

  def get_the_weather
    @current_location = Geocoder.search(@location.name).first
    @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=#{@current_location.latitude},#{@current_location.longitude}&units=f")
    return JSON.parse(@api)
  end

end
