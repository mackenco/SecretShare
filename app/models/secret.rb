class Secret < ActiveRecord::Base
  attr_accessible :text, :author_id, :recipient_id

  validates :text, :author_id, :recipient_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to(
    :recipient,
    class_name: "User",
    foreign_key: :recipient_id,
    primary_key: :id
  )

end
