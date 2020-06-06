Rails.application.routes.draw do
  root "mypages#index"
  resources :posts, only: [:index]
end

