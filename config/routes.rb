Rails.application.routes.draw do
  get 'pages/index'

  root to: "pages#home"
  devise_for :users

  devise_scope :user do
    get 'login', to: "devise/sessions#new"
    get 'signup', to: "devise/registrations#new"
    get 'logout', to: "devise/sessions#destroy"
  end
end
