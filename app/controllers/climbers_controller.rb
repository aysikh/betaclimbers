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
    if @climber.save
      redirect_to climber_path(@climber.id)
    else 
      render :new
  end

  def edit
    render :edit
  end

  def update
    @climber = Climber.update(climber_params)
    if @climber.save
      redirect_to climber_path(@climber)
    else
      render :edit
  end

  def destroy
    redirect_to climbers_path
  end

  private

  def find_climber
    id = Climber.find(params[:id])
  end

  def climber_params
    params.require(:climber).permit(:name, :experience, :birthyear, :bio, :height, :weight, :origin, :preference, :profile_pic)
  end


end
