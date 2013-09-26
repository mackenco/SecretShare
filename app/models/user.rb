class User < ActiveRecord::Base
  attr_accessible :name, :password
  attr_reader :password

  has_many(
    :authored_secrets,
    :class_name => "Secret",
    :foreign_key => :author_id
  )

  has_many(
    :received_secrets,
    :class_name => "Secret",
    :foreign_key => :recipient_id
  )

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 2, :allow_nil => true }
  validates :session_token, :presence => true
  validates :name, :presence => true

  after_initialize :ensure_session_token

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end