class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :current_username, :get_the_weather, :get_current_events, :logged_in?


  def current_user
    user_session = Climber.find_by(id: session[:climber_id])
    # if user_session == nil
    #   flash[:notice] = "You must be logged in. "
    #   redirect_to '/'
    # else
      return user_session
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

  def get_the_weather
    @current_location = Geocoder.search(@location.name).first
    @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=#{@current_location.latitude},#{@current_location.longitude}&units=f")
    return JSON.parse(@api)
  end

  def logged_in?
    return !!current_user
  end

  def authorized
    if !logged_in?
      flash[:notice] = "You must be logged in. "
      redirect_to '/' 
    end
  end
end
