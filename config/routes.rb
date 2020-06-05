Rails.application.routes.draw do
  root "posts#index"
  resources :posts, only: [:index]
  resources :login, only: [:index]
end

