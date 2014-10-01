Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy', :as => :logout
  get '/auth/failure' => 'sessions#auth_fail'
  get 'intro' => 'home#index', :as => :intro

  resources :users
  resources :spotfixes do
    get 'get_lat_lng', :on => :collection
    get 'share', :on => :member
  end
  
  resources :photos
  resource :attendees
  
  root :to => 'spotfixes#index'

end
