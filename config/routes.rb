Rails.application.routes.draw do

  # Put your routes here
  root 'places#index'
  get '/places' => 'places#index'
  get '/places/submit_new' => 'places#create'
  get '/places/new' => 'places#new'
  get '/places/:id' => 'places#show'
  get '/places/:id/delete' => 'places#delete'
  get '/places/:id/edit' => 'places#edit'
  get '/places/:id/update' => 'places#update'
end
