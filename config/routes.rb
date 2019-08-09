Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :sessions, only: [:create, :new]


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'pages#index'
end
