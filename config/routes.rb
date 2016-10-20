Rails.application.routes.draw do
  get '/sessions/new' => 'sessions#new'

  post '/sessions' => 'sessions#create'

  get '/sessions/delete' => 'sessions#delete'

  get '/users/new' => 'users#new'

  post '/users/create' => 'users#create'

  post '/secrets/create' => 'secrets#create'

  get '/secrets' => 'secrets#index'

  delete '/secrets/:id/delete' => 'secrets#destroy'

  get '/users/:id' => 'users#show'

  get '/users/:id/edit' => 'users#edit'

  patch '/users/:id/update' => 'users#update'

  delete '/users/:id/delete' => 'users#delete'






end
