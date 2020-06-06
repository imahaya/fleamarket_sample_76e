Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :items, only: [:index]
end
