Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get 'pages/show'
  get 'search',  to: 'pages#search'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }
  resources :users, only: [:show]

  resources :explorers, only: [:index, :show] do
    resources :reservations, only: [:create]
  end
  resources :listings do
    resources :reservations, only: [:create]
    resources :reviews,      only: [:create, :destroy]
  end

  resources :reservations, only: [:index]
  get '/reserved',  to: 'host/reservations#reserved'
  get '/setdate',   to: 'reservations#setdate'
  get '/duplicate', to: 'reservations#duplicate'

  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get 'manegelisting/:id/basics',      to: 'listings#basics',      as: 'manage_listing_basics'
  get 'manegelisting/:id/summary',     to: 'listings#summary',     as: 'manage_listing_summary'
  get 'manegelisting/:id/address',     to: 'listings#address',     as: 'manage_listing_address'
  get 'manegelisting/:id/price',       to: 'listings#price',       as: 'manage_listing_price'
  get 'manegelisting/:id/facility',    to: 'listings#facility',    as: 'manage_listing_facility'
  get 'manegelisting/:id/photos',      to: 'listings#photos',      as: 'manage_listing_photos'
  get 'manegelisting/:id/calendar',    to: 'listings#calendar',    as: 'manage_listing_calendar'
  get 'managelisting/:id/bankaccount', to: 'listings#bankaccount', as: 'manage_listing_bankaccount'
  get 'manegelisting/:id/map',         to: 'listings#map',         as: 'manage_listing_map'
  get 'manegelisting/:id/publish',     to: 'listings#publish',     as: 'manage_listing_publish'

  # stripe connect oauth path
  get '/connect/oauth',             to: 'stripe#oauth',       as: 'stripe_oauth'
  get '/connect/confirm',           to: 'stripe#confirm',     as: 'stripe_confirm'
  get '/connect/deauthorize',       to: 'stripe#deauthorize', as: 'stripe_deauthorize'


  namespace :host do
    resources :users, only: [:show]
  end
end
