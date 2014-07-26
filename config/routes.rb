Rails.application.routes.draw do

  get '/wikis/public', to: 'wikis#public'

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create]

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
