Rails.application.routes.draw do
  root 'users#index'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'

  # profile for user
  get '/profile/:id' => 'users#profile'

  resources :follows
  resources :users
  resources :sessions
  resources :messages
  resources :searchs
end
