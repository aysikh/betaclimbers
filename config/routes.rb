Rails.application.routes.draw do
  get 'climbers/new'
  get 'climber/profile', to: 'climbers#profile'
  # get 'climbers/login', to: 'climbers#login'
  post 'climbers/login', to: 'climbers#process_login'
  get 'climbers/logout', to: 'climbers#logout'
  get 'climbers/welcome', to: 'climbers#welcome'
  #trim this file down to just the routes you need upon refactoring
  resources :memberships
  resources :communities
  resources :locations
  resources :projects
  resources :routes
  resources :climbers

  get "/", to: "home#home"
end
