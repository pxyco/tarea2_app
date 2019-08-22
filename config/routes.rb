Rails.application.routes.draw do
  match '/users/:id',     to: 'users#show',       via: 'get'
  # resources :users, :only =>[:show, :edit]
  
#  resources :users
  root to: "posts#index"      
  
  resources :posts do
    patch :update_read_post
  end


  # devise_for :users
  devise_for :users, :path_prefix => 'd'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
