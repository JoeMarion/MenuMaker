class MealIngredient < ActiveRecord::Base
  belongs_to :meal
  belongs_to :ingredient

  validates :meal, :ingredient, presence: true
end
