Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#show'

  resources :users
  resources :drinks
  resources :comments, only: [:create, :update, :destroy]
  resources :ratings, only: [:create, :update]

  get 'drinks/:id/picture', to: 'drinks#picture', as:'drink_picture'
end
