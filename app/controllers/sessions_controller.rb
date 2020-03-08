class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to tweets_path
    else
      render 'new'
    end
  end
  
  def destroy
    session[:id] = nil
    redirect_to root_path
  end
  
  
end