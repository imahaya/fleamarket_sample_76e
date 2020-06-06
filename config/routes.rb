Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :login, only: [:index]
  resources :signup, only: [:index]
end

