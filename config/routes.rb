Rails.application.routes.draw do
  get "/", to: "home#home", as: "home_path"
  
  get 'climbers/new'
  get 'climber/profile', to: 'climbers#profile'
  # get 'climbers/login', to: 'climbers#login'
  post 'climbers/login', to: 'climbers#process_login'
  get 'climbers/logout', to: 'climbers#logout'
  get 'climbers/welcome', to: 'climbers#welcome'
  #trim this file down to just the routes you need upon refactoring
  resources :communities
  resources :locations
  resources :projects
  resources :routes
  resources :climbers
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]

  get 'climber/remove_community', to: 'climbers#remove_community'
  get 'climber/remove_route', to: 'climbers#remove_route'

end
