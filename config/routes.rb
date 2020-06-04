Rails.application.routes.draw do
  get 'login/controller'
  root to: 'posts#index'
end
