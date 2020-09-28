class UsersController < ApplicationController
  def new
  end

  def create
  end

  def login
    
  end

  def process_login
    user = User.find_by(username: params[:username])
    if user
      redirect_to climbers_path
    else
      flash.now[:no_user] = "That user does not exist"
      render :locations_path
    end


  end

  def logout
  end
end
