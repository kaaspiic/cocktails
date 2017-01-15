Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#show'

  resources :users
  resources :drinks
  resources :comments, only: [:create, :update, :destroy]
  resources :ratings, only: [:create, :update, :destroy]
end
