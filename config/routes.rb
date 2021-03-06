Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  resources :posts do
    member do
      post 'like'
    end
  end
  
  resources :users, except: [:new, :destroy]
  
  get '/register', to: 'users#new'
  
  #login -> new session
  #logout -> close session
  #post login -> create session
  
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
  resources :trends, only: [:new, :create, :show]
  resources :topics, only: [:new, :create, :show]
  
  
end
