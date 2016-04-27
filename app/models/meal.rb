class Meal < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  belongs_to :user

  validates :name, presence: true
  validate :has_user_id

  private

  def has_user_id
    errors.add(:has_user_id, 'must be created by user') if self.user.nil?
  end
end
