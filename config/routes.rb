Rails.application.routes.draw do
  root 'public#index'

  # AUTHENTICATION
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  # Users - custom routes for users, registration, profile, editing etc
  get "register" => "users#new"
  post "register" => "users#create"
  get "profile" => "users#show"
  get "profile/edit" => "users#edit"
  put "profile" => "users#update"
  patch "profile" => "users#update"
  resources :users, only: [:index, :destroy] do
    patch 'admin' => "users#toggle_admin", on: :member
  end

  # RESOURCES
  resources :circuses
  resources :dogs do
    resources :fleas#, shallow: true
  end

end
