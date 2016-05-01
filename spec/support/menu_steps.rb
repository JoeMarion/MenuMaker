module MenuSteps
  def login_user(user)

  end

  def visit_meal_form(user)
    visit(user_menus_path(user))
  end

  def i_should_see_ingredients_header
    expect(page).to have_content("Ingredients")
  end

  def i_should_see_meals_header
    expect(page).to have_content("Meals")
  end

  def i_should_see_created_meal_named(name)
    expect(page.find("#created-meals")).to have_content(name)
  end

  def visit_homepage
    visit('/')
  end
end
