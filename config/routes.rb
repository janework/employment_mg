Rails.application.routes.draw do


  resources :firms
  resources :collabs
  resources :functions
  resources :contracts

  devise_for :users
  root to: 'firms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
