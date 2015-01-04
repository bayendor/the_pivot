Rails.application.routes.draw do
  root 'home#index'

  resources :users

  post '/cart',          to: 'cart#create'
  delete '/cart',          to: 'cart#remove_item'
  post '/cart_update',   to: 'cart#update_quantity'

  resources :cart, only: [:index]
  resources :loans, only: [:index]
  resources :loan_requests, only: [:index, :new, :show, :create, :update, :edit]
  resources :categories, only: [:index, :show]

  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'tenants', to: 'tenants#index'
  post 'tenants', to: 'tenants#create'

  resources :tenants, as: :tenant, path: '', param: :slug do
    get '/admin', to: 'admin/base_admin#index', as: :admin_index

    resources :orders, only: [:index, :new, :show, :create]

    namespace :admin do
      resources :users
      resources :orders, only: [:index, :show, :update]
    end

    put 'admin/remove_item', to: 'admin/orders#remove_item'
    post 'admin/update_quantity', to: 'admin/orders#update_quantity'
  end
end
