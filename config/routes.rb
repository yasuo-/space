Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get 'pages/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }
  resources :reservations
  resources :listings do
    resources :reservations, only: [:create]
  end

  get 'manegelisting/:id/basics',   to: 'listings#basics',   as: 'manage_listing_basics'
  get 'manegelisting/:id/summary',  to: 'listings#summary',  as: 'manage_listing_summary'
  get 'manegelisting/:id/address',  to: 'listings#address',  as: 'manage_listing_address'
  get 'manegelisting/:id/price',    to: 'listings#price',    as: 'manage_listing_price'
  get 'manegelisting/:id/facility', to: 'listings#facility', as: 'manage_listing_facility'
  get 'manegelisting/:id/photos',   to: 'listings#photos',   as: 'manage_listing_photos'
  get 'manegelisting/:id/calendar', to: 'listings#calendar', as: 'manage_listing_calendar'
  get 'manegelisting/:id/map',      to: 'listings#map',      as: 'manage_listing_map'
  get 'manegelisting/:id/publish',  to: 'listings#publish',  as: 'manage_listing_publish'


  namespace :host do
    resources :users
    resources :rooms
  end
end
