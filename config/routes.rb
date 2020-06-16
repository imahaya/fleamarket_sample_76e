Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  root "posts#index"
  resources :posts, only: [:index]
  resources :items, only: [:index,:new,:create,:show]
  resources :mypages, only: [:index]
  resources :purchases, only: [:index]
  resources :addresses, only: [:new, :create]
  resources :users, only: [:index,:edit, :update]
end
