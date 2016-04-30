module MenuSteps
  def log_in_user(user)
    visit '/login'
    within("#new_user") do
      fill_in 'Email' with: user.email
      fill_in 'Password' with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Success'
  end
  def visit_homepage
    visit('/')
  end
end
