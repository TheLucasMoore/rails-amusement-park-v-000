Rails.application.routes.draw do

  get 'sessions/new'

  resources :attractions
  resources :users
  resources :rides, only: [:new, :create]

  root 'static#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end