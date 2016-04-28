require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { should belong_to(:category).class_name('Category') }

  let(:user) { User.create!(first_name: "Joe", last_name: "Tester",
                            email: "joe@example.com", password: "password",
                            password_confirmation: "password")}

  let(:category) { Category.create!(section: "Dairy")}

  let(:ingredient) { user.ingredients.create!(name: "Colby Jack Cheese",
                                              category: category)}

  let(:no_name_ingredient) { user.ingredients.create!(name: "", category: category)}

  describe 'validations' do
    context 'will raise an error' do

      it 'when the name is empty' do
        no_name_ingredient.save
        expect(no_name_ingredient.errors[:name]).to include("can't be blank")
      end
    end
  end
end
