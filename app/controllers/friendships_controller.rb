class FriendshipsController < ApplicationController
  
  def create
    friendship = Friendship.new(user_id: current_user.id, friend_id: params[:format])
    if friendship.save
      redirect_to users_path
    else
      render 'index'
    end
  end
  
  def destroy
    friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    friendship.destroy
    redirect_to users_path
  end
 
  
end