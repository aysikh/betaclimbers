Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/login', to: 'users#login'
  post 'users/login', to: 'users#process_login'
  get 'users/logout', to: 'users#logout'
  #trim this file down to just the routes you need upon refactoring
  resources :memberships
  resources :communities
  resources :locations
  resources :projects
  resources :routes
  resources :climbers
  get "/", to: "home#home"

end
