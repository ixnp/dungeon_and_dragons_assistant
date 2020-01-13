class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(article_params)
        @user.save
        redirect_to user_path(@user)
    end 
  
    private
  
    def user_params
      params.require(:user).permit(:name)
    end 
end