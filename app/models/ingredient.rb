class Ingredient < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients

  belongs_to :category
  belongs_to :user
end
