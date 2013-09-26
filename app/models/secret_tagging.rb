class SecretTagging < ActiveRecord::Base
  attr_accessible :secret_id, :tag_id

  belongs_to(
    :tag,
    class_name: "Tag",
    foreign_key: :tag_id,
    primary_key: :id)

  belongs_to(
    :secret,
    class_name: "Secret",
    foreign_key: :secret_id,
    primary_key: :id)
end
