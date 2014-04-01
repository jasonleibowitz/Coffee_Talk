CoffeetalkApp::Application.routes.draw do

  resources :users do
    collection do
      get 'profile'
    end
  end
  resources :interests do
    collection do
      get 'select'
      post 'save_prefs'
    end
  end
  resources :locations do
    collection do
      get 'view'
    end
  end
  resources :meetings
  resources :requests

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'users#profile'
end
