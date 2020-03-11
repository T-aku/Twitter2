class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to tweets_path
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end
  
  def index
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  
end