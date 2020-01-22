class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      token = SecureRandom.urlsafe_base64(20)
      cookies[:sessiontoken] = token
      user.update_column("sessiontoken", token)
      session[:user_id] = user.id
      flash[:success] = "welcome back"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Password or Email did not match, please try again"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "logged out"
    redirect_to login_path
  end
end
