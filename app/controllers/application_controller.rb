class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||  User.find(session[:user_id]) if session[:user_id]
    end
    114

    # !! converts a value into a boolean
    def logged_in?
        !!current_user
    end

    def require_user
        if !logged
            flash[:danger] = "please login"
            redirect_to login_path
        end
    end
end
