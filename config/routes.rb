Rails.application.routes.draw do
  get 'users/index'
  match '/users/:id',     to: 'users#show',       via: 'get'
  # resources :users, :only =>[:show, :edit]
  
  resources :users
  resources :posts
  root to: "users#index"

  # devise_for :users
  devise_for :users, :path_prefix => 'd'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
