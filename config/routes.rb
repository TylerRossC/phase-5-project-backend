Rails.application.routes.draw do
  
  resources :songs
  resources :playlists
  resources :users

  get '/me', to: 'users#show'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  delete '/songs/:id', to: 'songs#destroy'
end
