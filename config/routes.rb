Rails.application.routes.draw do
  root "items#index"
  resources :posts, only: [:index]
end

