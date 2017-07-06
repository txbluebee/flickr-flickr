Rails.application.routes.draw do

  #User authentication
  root 'images#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  #images
  resources :images do
    resources :tags, except: [:index, :show]
    resources :comments, except: [:index, :show]
  end

  #users
  resources :users

end
