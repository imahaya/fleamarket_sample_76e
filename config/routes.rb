Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  root "posts#index"
  resources :posts, only: [:index,:show]
  resources :items, only: [:index,:new,:create]
  resources :mypages, only: [:index]
  resources :purchases, only: [:index]
  resources :addresses, only: [:new, :create]
  resources :users, only: [:index,:edit, :update]
end
