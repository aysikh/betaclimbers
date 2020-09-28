class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end

  def login
    byebug
  end

  def process_login
    user = User.find_by(username: params[:username])
    if user
      redirect_to climbers_path
    else
      flash[:no_user] = "That user does not exist"
      redirect_to "/"
    end


  end

  def logout
  end

end
