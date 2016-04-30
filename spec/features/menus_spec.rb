require 'rails_helper'
require 'support/menu_steps'

RSpec.feature "Menus", type: :feature do
  it "shows me the Start New Menu header"

  context "with completed meals" do
    before do
      user = create(:user)
      login_user(user)
      visit_meal_form(user)
      created_complete_meal("Chicken Salad")
    end

    it "shows completed meal, in the meal index"
  end
end
