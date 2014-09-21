Rails.application.routes.draw do

  root to: 'sites#index'

  resources :users

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  # for development only
  get "/logout" => "session#destroy"
  
end
