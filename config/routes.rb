Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy', :as => :logout
  get '/auth/failure' => 'sessions#auth_fail'

  resources :users
  resources :spotfixes
  resources :photos

  root :to => 'home#index'
end
