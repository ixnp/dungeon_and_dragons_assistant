class SessionsController < ApplicationController
  def new
    if User.find_by(sessiontoken: cookies[:sessiontoken])
      user = User.find_by(sessiontoken: cookies[:sessiontoken])
      user.set_token(cookies)
      session[:user_id] = user.id
      redirect_to user_path(user)
    end 
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      user.set_token(cookies)
      session[:user_id] = user.id
      flash[:success] = "welcome back"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Password or Email did not match, please try again"
      render "new"
    end
  end

  def destroy
    cookies[:sessiontoken] = nil
    session[:user_id] = nil
    flash[:success] = "logged out"
    redirect_to login_path
  end
end
