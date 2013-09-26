class Secret < ActiveRecord::Base
  attr_accessible :text, :author_id, :recipient_id, :tag_ids

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

  has_many(
    :secret_taggings,
    class_name: "SecretTagging",
    foreign_key: :secret_id,
    primary_key: :id)

  has_many(
    :tags, through: :secret_taggings, source: :tag)


end
