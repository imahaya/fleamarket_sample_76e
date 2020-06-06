Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :items, only: [:index]
  resources :mypages, only: [:index]
  resources :login, only: [:index]
  resources :signup, only: [:index]
end
