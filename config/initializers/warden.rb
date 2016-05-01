Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:password) do
  # Checks each strategy to determine which strategy is valid to auth
  def valid?
    params['session']['email'] && params['session']['password']
  end

  def authenticate!
    user = User.find_by(email: params['session']['email'])
    if user && user.authenticate(params['session']['password'])
      success! user
    else
      fail 'Invalid email or password'
    end
  end
end
