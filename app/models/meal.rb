class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  belongs_to :user
  belongs_to :menu

  validates :name, presence: true
  validate :has_user_id

  private

  # Checks if there is a user_id associated with ingredient
  # DRY it up with concerns
  def has_user_id
    errors.add(:has_user_id, 'must be created by user') if self.user.nil?
  end
end
