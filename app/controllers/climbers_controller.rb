class ClimbersController < ApplicationController
  before_action :find_climber, only: [:show, :edit, :delete, :update]
  before_action :authorized, except: [:process_login, :new, :create]

  def index
    @climbers = Climber.all
  end

  def show
    id = params[:id]
    @climber = Climber.find(id)
  end
  
  def welcome
    @api = get_users_weather()["current"]
  end

  def login
  end

  def process_login
    climber = Climber.find_by(username: params[:username])
    if climber && climber.authenticate(params[:password])
      session[:climber_id] = climber.id
      redirect_to climbers_welcome_path(climber)
    else
      flash[:no_user] = "Username or password is incorrect."
      redirect_to "/"
    end
  end

  def logout
    session.clear 
    redirect_to '/'
  end

  def new
    @climber = Climber.new
  end

  def create
    @climber = Climber.new(climber_params)
    if @climber.save
      session[:climber_id] = @climber.id
      redirect_to edit_climber_path(@climber)
    else
      render :new
    end
  end

  def profile
    @climber = Climber.find_by(id: session[:climber_id])
    
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
    @climber.update(profile_params)
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
    params.require(:climber).permit(:username, :password)
  end

  def profile_params
    params.require(:climber).permit(:name, :experience, :birthyear, :bio, :height, :weight, :origin, :preference, :profile_pic)
  end

end
