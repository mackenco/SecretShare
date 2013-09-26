class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id])
    sleep(2)
    @friendship.save
    head :ok
  end

  def destroy
    @friendship = Friendship.where(user_id: current_user.id, friend_id: params[:user_id])
                            .first
    sleep(1)
    @friendship.destroy
    head :ok
  end
end
