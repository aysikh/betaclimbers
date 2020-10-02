class RoutesController < ApplicationController
  before_action :find_route, only: [:show, :edit, :update, :delete]
  # skip_before_action :verify_authenticity_token
  before_action :authorized
  def index
    @routes = Route.all 
  end

  def show
    @climbers = @route.climbers.uniq
  end

  def new
    @route = Route.new
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
  end

  def update
    if params[:add_like]
      @route.add_like
      redirect_to route_path(@route)
    elsif params[:add_route]
      Climber.find(session[:climber_id]).routes.push(@route)
      redirect_to route_path(@route)
    else
      @route.update(route_params)
      if @route.save
        redirect_to route_path(@route)
      else
        render :edit
      end
    end
  end

  def destroy
    redirect_to routes_path
  end


  private

  def find_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :difficulty, :style, :location_id)
  end
end
