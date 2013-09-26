class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

  validates :friend_id, :user_id, presence: true
  validates :friend_id, uniqueness: { scope: :user_id }

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :friend,
    class_name: "User",
    foreign_key: :friend_id,
    primary_key: :id
  )

  def self.can_friend?(user, friend)
    return false if user == friend
    not Friendship.exists?(user_id: user.id, friend_id: friend.id)
  end

  def self.can_unfriend?(user, friend)
    # return false if user == friend
    Friendship.exists?(user_id: user.id, friend_id: friend.id)
  end

end
