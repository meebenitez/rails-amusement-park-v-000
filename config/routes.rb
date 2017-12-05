Rails.application.routes.draw do

  #root to: 'users#homepage'
  root 'application#index'
 

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions
  get '/ride' => 'rides#create'

 
  


end