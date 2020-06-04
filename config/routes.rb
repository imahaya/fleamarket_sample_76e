Rails.application.routes.draw do
  get 'login/controller'
  root to: 'items#index'
end
