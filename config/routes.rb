Rails.application.routes.draw do

  root to: 'sites#index'

  ## main routing
  resources :users do 
    resources :courses do 
      resources :polls do 
        resources :replies do
        end
      end
    end
  end

  ## for showing courses to the public
  ## to see courses the user isn't necessarily in
  resources :courses do 
    resources :polls do
    end
  end

  ## for creating new polls, only links user and polls they created
  resources :users do 
    resources :polls do 
    end
  end

  ## for showing all replies by a specific user
  # resources :users do 
  #   resources :replies do 
  #   end 
  # end

  post '/join_course' => 'courses#join_course'
  post '/leave_course' => 'courses#leave_course'

  post 'send_sms' => 'sendtexts#send_text_message'
  # get 'send_sms' => 'sendtexts#send_text_message'
  post 'sms' => 'receive_messages#index'
  # ## testing
  get 'sms' => 'receive_messages#index'

  # post '/search', to: 'replies#search'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
  # for development only
  get '/logout' => 'sessions#destroy'
  
end
