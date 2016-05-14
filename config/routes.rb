Rails.application.routes.draw do

  get 'pages/index'

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'signup', to: "users#new"
  get 'logout', to: "sessions#destroy"

  root to: "pages#home"

  resources :users do
    resources :menus, only: [:index, :new, :create, :show, :destroy, :update]
  end


end
