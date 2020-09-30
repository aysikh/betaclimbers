module LocationsHelper


  def get_the_weather
    @current_location = Geocoder.search(@location.name).first
    @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=#{@current_location.latitude},#{@current_location.longitude}&units=f")
    return JSON.parse(@api)
  end


end
