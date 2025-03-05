Rails.application.routes.draw do
  get "home/index"


devise_for :customers, path: 'customer', path_names: { sign_in: 'login', sign_out: 'logout' }

resources :products, only: [:index, :show]         

resource :cart, only: [:show] do
  resources :cart_items, only: [:create, :destroy]
  post 'add/:product_id', to: 'carts#add', as: 'add'
  delete 'remove/:product_id', to: 'carts#remove', as: 'remove'
  patch 'update/:product_id', to: 'carts#update', as: 'update'
  post 'checkout', to: 'orders#create'
end

resources :orders, only: [:index, :show]


root "home#index" 


devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
    namespace :admin do
      resources :products
      resources :customers
      resources :orders
      root "dashboard#index"
    end

  end
