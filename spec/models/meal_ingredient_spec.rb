require 'rails_helper'

RSpec.describe MealIngredient, type: :model do
  let(:user) { User.create!(first_name: "Joe",
                            last_name: "Tester",
                            email: "joe@example.com",
                            password: "password",
                            password_confirmation: "password")}
let(:meal) { user.meals.create!(name: "Grool") }
let(:category) { user.categories.create!(section: "Dairy") }
let(:ingredient) { user.ingredients.create!(name: "Slop", category: category) }
let(:meal_ing) { MealIngredient.new(meal: meal, ingredient: ingredient) }
let(:no_meal_ing) { MealIngredient.new(ingredient: ingredient) }
let(:no_ing_meal) { MealIngredient.new(meal: meal) }

  describe 'validations' do
    context 'will raise an error' do
      it 'when no meal is associated with meal ingredient' do
        no_meal_ing.save
        expect(no_meal_ing.errors[:meal]).to include("can't be blank")
      end
      it 'when no ingredient is associated with meal' do
        no_ing_meal.save
        expect(no_ing_meal.errors[:ingredient]).to include("can't be blank")
      end
    end

    it 'saves the MealIngredient when a User adds ingredient to meal' do
      expect{meal_ing.save}.to change{MealIngredient.count}.by(1)
    end
  end
end
