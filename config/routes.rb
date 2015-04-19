Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  #get '/posts', to: 'posts#index'
  #get '/posts/new', to: 'posts#new', as: 'new_post'
  #post '/posts', to: 'posts#create'
  #get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  #patch '/posts/:id', to: 'posts#update'
  #get '/posts/:id', to: 'posts#show', as: 'post' 
  #delete '/posts/:id', to: 'posts#destroy'
  
  resources :posts do
    member do
      post 'like'
    end
  end
  
  
end
