CoffeetalkApp::Application.routes.draw do

  resources :users
  resources :interests
  resources :locations
  resources :meetings

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'users#show'
end
