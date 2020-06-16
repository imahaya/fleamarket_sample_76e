Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :items, only: [:new,:create]
  resources :mypages, only: [:index]
  resources :purchases, only: [:index]
  resources :addresses, only: [:new, :create]
  resources :users, only: [:edit, :update]
  resources :cards, only: [:new, :show, :edit, :update, :create, :destroy]
end
