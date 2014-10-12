Rails.application.routes.draw do

  root to: 'sites#index'

  get 'home' => 'users#home'

  ## old setup
  # resources :users do
  # 	resources :polls do 
  #       resources :replies
  #     end
  # end
  # resources :students do
  # end


  resources :courses do 
    resources :polls do
      resources :replies do
      end
    end
  end

  resources :users do 
    # what other relationships for routing?
  end


  post 'send_sms' => 'sendtexts#send_text_message'
  # get 'send_sms' => 'sendtexts#send_text_message'
  post 'sms' => 'receive_messages#index'
  # ## testing
  # get 'sms' => 'receive_messages#index'

  # post '/search', to: 'replies#search'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  # for development only
  # get '/logout' => 'sessions#destroy'
  
end
