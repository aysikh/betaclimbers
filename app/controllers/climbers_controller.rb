class ClimbersController < ApplicationController
  before_action :find_climber, only: [:show, :edit, :delete, :update]

  def index
    @climbers = Climber.all
  end

  def show
    id = params[:id]
    @climber = Climber.find(id)
  end

  def new
    @climber = Climber.new
  end

  def create
    @climber = Climber.new(climber_params)
    communities = params["climber"]["communities"]
    communities.shift
    communities.each do |community|
      @climber.communities << Community.find(community.to_i)
    end
    if @climber.save
      redirect_to climber_path(@climber.id)
    else 
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @climber.update(climber_params)
    if @climber.save
      redirect_to climber_path(@climber)
    else
      render :edit
    end
  end

  def destroy
    redirect_to climbers_path
  end

  private

  def find_climber
    @climber = Climber.find(params[:id])
  end

  def climber_params
    params.require(:climber).permit(:name, :experience, :birthyear, :bio, :height, :weight, :origin, :preference, :profile_pic)
  end

end
