require 'rails_helper'

RSpec.describe Meal, type: :model do
  let(:user) { User.create!(first_name: "Joe",
                            last_name: "Tester",
                            email: "joe@example.com",
                            password: "password",
                            password_confirmation: "password")}
  let(:meal) { user.meals.new(name: "Turkey Sandwich") }
  let(:no_name_meal) { user.meals.new(name:"") }
  let(:no_user_meal) { Meal.new(name: "No user sandwich") }

  describe 'validations' do
    context 'will raise an error' do

      it 'when the name is empty' do
        no_name_meal.save
        expect(no_name_meal.errors[:name]).to include("can't be blank")
      end

      it 'when no user associated with meal' do
        no_user_meal.save
        expect(no_user_meal.errors[:has_user_id]).to include("must be created by user")
      end
    end

    it 'saves the Meal when a User creates a meal with a name' do
      expect{meal.save}.to change{Meal.count}.by(1)
    end
  end
end
