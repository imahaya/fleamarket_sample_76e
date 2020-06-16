Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :items do
    collection do
      get :search
    end
  end
  resources :mypages, only: [:index]
  resources :purchases, only: [:index]
  resources :addresses, only: [:new, :create]
  resources :users, only: [:edit, :update]
end
