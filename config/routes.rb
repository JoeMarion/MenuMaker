Rails.application.routes.draw do

  get 'pages/index'

  root to: "pages#home"
  devise_for :users, controllers: { registrations: "registrations"}

  resources :users do
    resources :menus, only: [:index, :create, :show, :destroy, :update]
  end

  devise_scope :user do
    get 'login', to: "devise/sessions#new"
    get 'signup', to: "devise/registrations#new"
    get 'logout', to: "devise/sessions#destroy"
  end
end
