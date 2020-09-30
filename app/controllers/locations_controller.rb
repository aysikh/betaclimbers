class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :delete]

  def index
    @locations = Location.all
  end

  def show
    
    #before_action above pasees the @location
    @api = RestClient.get("http://api.weatherstack.com/current?access_key=ff84e265083ca3b8a1a2a6c945f602ef&query=18,47&units=f")
    @parsed = JSON.parse(@api)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      redirect_to location_path(@location.id)
    else
      render :new
    end
  end

  def edit
    #before_action above pasees the @location
  end

  def update
    @location.update(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  def destroy
    redirect_to locations_path
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end
  
  def location_params
    params.require(:location).permit(:name, :rock_type, :approach, :popularity, :picture)
  end

end
