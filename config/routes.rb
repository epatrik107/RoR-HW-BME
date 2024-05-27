Rails.application.routes.draw do

  resources :images
  resources :products
  resources :categories
  devise_for :users
  get 'home/about'
  root 'home#index'
  get '/kosar', to: 'order_items#index', as: 'kosar'
  resources :order_items, only: [:index, :create, :destroy]
  resources :orders do
    member do
      post 'add/:product_id', to: 'orders#add', as: 'add_to_cart'
      delete 'remove/:product_id', to: 'orders#remove', as: 'remove_from_cart'
    end
  end
end

