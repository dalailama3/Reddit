class User < ActiveRecord::Base
  after_initialize do
    ensure_session_token
  end
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true

  has_many :subs, foreign_key: "moderator_id"
  has_many :posts, foreign_key: "author_id", inverse_of: :author

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest ||= BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
