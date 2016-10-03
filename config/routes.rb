Rails.application.routes.draw do
  root 'public#index'

  resources :circuses
  resources :fleas
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
