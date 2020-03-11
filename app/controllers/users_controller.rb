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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def user_params_update
    params.require(:user).permit(:username, :email, :password, :image)
  end
  
  
end