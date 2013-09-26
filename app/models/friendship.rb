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

end
