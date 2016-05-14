class PagesController < ApplicationController
  def home
      # Set user var if user is logged in
      @user = current_user if logged_in?
  end
end
