class UsersController < ApplicationController
  before_action :set_user, only: [ :show]
  def new
    @user = User.new
  end

  def show
   
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
    session[:user_id] = @user.id
    flash[:success] = "Welcome To DnD Helper.inc"
    
    redirect_to user_path(@user)
    else 
        render 'new'
    end
  end

  def update
    @user.update(user_params)
    byebug
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
