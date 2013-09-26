class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id])

    if @friendship.save
      redirect_to current_user
    else
      redirect_to users_url
    end

  end
end
