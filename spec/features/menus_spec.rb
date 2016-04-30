require 'rails_helper'
require 'support/menu_steps'

RSpec.feature "Menus", type: :feature do
  include MenuSteps
  it "shows me the Start New Menu header"

  context "with completed meals" do
    before do
      user = FactoryGirl.create(:user)
      login_user(user)
      visit_meal_form(user)
      created_complete_meal("Chicken Salad")
    end

    xit "has a current user" do
      puts user
      expect(user).not_to be(nil)
    end
    xit "shows completed meal, in the meal index"
  end
end
