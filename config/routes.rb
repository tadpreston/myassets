Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#home'
end
