Rails.application.routes.draw do
  root "items#index"
  resources :posts, only: [:index,:show]
  resources :items, only: [:index]
  resources :mypages, only: [:index]
  resources :login, only: [:index]
  resources :signup, only: [:index]
  resources :purchases, only: [:index]
end
