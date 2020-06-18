Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  root "posts#index"
  resources :posts, only: [:index]

  resources :items do
    collection do
      get :search
    end
    member do
      resources :purchases, only: [:index,:update] do
        collection do
          get 'index', to: 'purchases#index'
          post 'pay', to: 'purchases#pay'
          get 'pay', to: 'purchases#pay'
          get 'done', to: 'purchases#done'
        end
      end
    end
  end

  resources :mypages, only: [:index]
  resources :addresses, only: [:new, :create]
  resources :users, only: [:index,:edit, :update]
  resources :cards, only: [:new, :show, :edit, :update, :create, :destroy]
end
