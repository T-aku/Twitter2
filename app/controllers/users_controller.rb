class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      flash[:success] = "Welcome to Shimogai's Twitter"
      redirect_to root_path
    else
      flash[:danger] = "Enter your information again"
      render 'new'
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  
end