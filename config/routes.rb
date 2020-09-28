Rails.application.routes.draw do
  #trim this file down to just the routes you need upon refactoring
  resources :memberships
  resources :communities
  resources :locations
  resources :projects
  resources :routes
  resources :climbers
  get "/home", to: "home#home"

end
