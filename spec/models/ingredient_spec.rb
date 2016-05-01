require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:meals).through(:meal_ingredients) }

  let(:user) { FactoryGirl.create(:user) }

  let(:category) { user.categories.create!(section: "Dairy") }

  let(:ingredient) { user.ingredients.create!(name: "Colby Jack Cheese",
                                              category: category) }

  let(:no_name_ingredient) { user.ingredients.new(name: "", category: category) }
  let(:no_user_ingredient) { Ingredient.new(name: "No user", category: category) }

  describe 'validations' do
    context 'will raise an error' do

      it 'when the name is empty' do
        no_name_ingredient.save
        expect(no_name_ingredient.errors[:name]).to include("can't be blank")
      end

      it 'when no user associated with ingredient' do
        no_user_ingredient.save
        expect(no_user_ingredient.errors[:has_user_id]).to include("must be created by user")
      end
    end

    it 'saves the Ingredient when a User creates an ingredient with a name' do
      expect{ingredient.save}.to change{Ingredient.count}.by(1)
    end
  end
end
