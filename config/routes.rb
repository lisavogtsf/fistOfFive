Rails.application.routes.draw do

  root to: 'sites#index'

  resources :users do
  	resources :polls
  end

  post 'send_sms' => 'sendtexts#send_text_message'
  get 'sms' => 'receive_messages#index'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  # for development only
  get "/logout" => "sessions#destroy"
  
end
