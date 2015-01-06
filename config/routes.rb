Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  resources :users

  post '/cart',          to: 'cart#create'
  post '/cart_update',   to: 'cart#update'
  delete '/cart',        to: 'cart#remove_item'

  resources :cart, only: [:index]
  resources :loans, only: [:index]
  resources :loan_requests, only: [:index, :new, :show, :create, :update, :edit]

  resources :categories, as: :category, path: 'categories', param: :slug

  get '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'tenants', to: 'tenants#index'
  post 'tenants', to: 'tenants#create'

  resources :tenants, as: :tenant, path: '', param: :slug

end
