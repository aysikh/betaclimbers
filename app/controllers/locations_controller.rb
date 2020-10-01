class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :delete]
  before_action :authorized
  def index
    @locations = Location.all
  end

  def show
    #before_action above pasees the @location

    @api = get_the_weather()["current"]
    
    # @parsed = JSON.parse(@api)
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
