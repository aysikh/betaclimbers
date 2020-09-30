class HomeController < ApplicationController
# require 'rest client'
  def home
    # @api = RestClient.get("api.openweathermap.org/data/2.5/weather?q=boston&appid=27c4632a3b3dafdb2657410a0b3dd803")
    # @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=' + latitude + ',' + longitude + '&units=f")
    @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=18,47&units=f")
    # @api = RestClient.get("https://jsonplaceholder.typicode.com/users")
  end

end
