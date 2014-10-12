Rails.application.routes.draw do

  get 'courses/_course_form.html.erb'

  root to: 'sites#index'

  resources :users do
  	resources :polls do 
        resources :replies
      end
  end

  resources :students do
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
