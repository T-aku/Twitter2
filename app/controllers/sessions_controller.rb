class SessionsController < ApplicationController
  
  def new
    @user = User.all
  end
  
  
end