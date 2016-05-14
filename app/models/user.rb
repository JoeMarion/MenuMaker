class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :meals
  has_many :ingredients
  has_many :categories
  has_many :menus

  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :username,   presence: true,
                         length: { maximum: 12 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@(?!.*([._%+-])\1)[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,      presence: true,
                         uniqueness: { case_sensitive: false },
                         length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX }
  validates :password,   presence: true,
                         length: { minimum: 6 }

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persisten sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
