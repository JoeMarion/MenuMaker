class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Returns the current logged in user
  def current_user
    warden.user
  end
  helper_method :current_user

  def warden
    env['warden']
  end
end
