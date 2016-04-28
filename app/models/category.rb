class Category < ActiveRecord::Base
  has_many :ingredients
  belongs_to :user

  validates :section, presence: true
  validate :has_user_id

  # Checks if there is a user_id associated with ingredient
  # DRY it up with concerns
  def has_user_id
    errors.add(:has_user_id, 'must be created by user') if self.user.nil?
  end
end
