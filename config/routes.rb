Rails.application.routes.draw do
  root to: 'pages#index'

  get '/show', to: 'pages#show'
  get '/callback', to: 'pages#callback'
  
  resources :reservations
  resources :listings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
