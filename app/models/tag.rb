class Tag < ActiveRecord::Base
  attr_accessible :text

  validates :text, presence: true

  has_many(
    :secret_taggings,
    class_name: "SecretTagging",
    foreign_key: :tag_id,
    primary_key: :id)

  has_many(
    :secrets, through: :scret_taggings, source: :secret
  )
end
