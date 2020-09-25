class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :delete]

  def index
    @locations = Location.all
  end

  def show
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
    render :edit
  end

  def update
    @location = Location.update(location_params)
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
    params.require(:location).permit(:name, :rock_type, :approach, :popularity, :picture)
  end

  def location_params
    id = Location.find(params[:id])
  end
  
end
