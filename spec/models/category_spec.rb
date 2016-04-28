require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to have_many(:ingredients) }
  it { is_expected.to belong_to(:user) }

  let(:user) { User.create!(first_name: "Joe", last_name: "Tester",
                            email: "joe@example.com", password: "password",
                            password_confirmation: "password") }

  let(:category) { user.categories.create!(section: "Dairy")}
  let(:no_user_category) { Category.new(section: "Dairy")}
  let(:no_section_category) { user.categories.new(section: "")}

  describe 'validations' do
    context 'will raise an error' do
      it 'when section is blank' do
        no_section_category.save
        expect(no_section_category.errors[:section]).to include("can't be blank")
      end

      it 'when no user is associated with category' do
        no_user_category.save
        expect(no_user_category.errors[:has_user_id]).to include("must be created by user")
      end
    end

    it 'saves the Category when created' do
      expect{category.save}.to change{Category.count}.by(1)
    end
  end
end
