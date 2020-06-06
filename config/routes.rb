Rails.application.routes.draw do
  root "purchases#index"
  resources :posts, only: [:index]
end

