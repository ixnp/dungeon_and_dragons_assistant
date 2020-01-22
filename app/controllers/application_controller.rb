class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # !! converts a value into a boolean
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "please login"
      redirect_to login_path
    end
  end
end
