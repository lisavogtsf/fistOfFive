Rails.application.routes.draw do

  get 'polls/index'

  get 'polls/create'

  get 'polls/update'

  get 'polls/destroy'

  root to: 'sites#index'

  resources :users do
  	resources :polls
  end

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  # for development only
  get "/logout" => "sessions#destroy"
  
end
