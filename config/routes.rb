CoffeetalkApp::Application.routes.draw do

  resources :users
  resources :interests do
    collection do
      get 'select'
      post 'save_prefs'
    end
  end
  resources :locations
  resources :meetings
  resources :requests

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'users#show'
end
