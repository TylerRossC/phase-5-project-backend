Rails.application.routes.draw do
  resources :playlists
  resources :users
root :to => 'home#index'
end
