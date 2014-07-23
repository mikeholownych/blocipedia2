Rails.application.routes.draw do
  resources :collaborators

  resources :wikis

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
