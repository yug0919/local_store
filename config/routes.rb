Rails.application.routes.draw do
  get "home/index"


devise_for :customers, path: 'customer', path_names: { sign_in: 'login', sign_out: 'logout' }

resources :products, only: [:index, :show]         
resources :orders, only: [:new, :create]

root "home#index" 


devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
    namespace :admin do
      resources :products
      resources :customers
      resources :orders
      root "dashboard#index"
    end

  end
