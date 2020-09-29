class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def login
    
  end

  def process_login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:no_user] = "Username or password is incorrect."
      redirect_to "/"
    end
  end

  def logout
  end

  private




end
