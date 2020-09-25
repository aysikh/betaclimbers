class RoutesController < ApplicationController
  before_action :find_route, only: [:show, :edit, :update, :delete]

  def index
    @routes = Route.all 
  end

  def show
  end

  def new
    @climber = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to route_path(@route.id)
    else
      render :edit
    end
  end

  def edit
    render :edit
  end

  def update
    @route = Route.update(route_params)
    if @route.save
      redirect_to route_path(@route)
    else
      render :edit
    end
  end

  def destroy
    redirect_to routes_path
  end


  private

  def find_route
    id = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :difficulty, :style, :location_id)
  end
end
