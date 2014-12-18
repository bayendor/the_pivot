Rails.application.routes.draw do
  root 'home#index'

  resources :users

  post '/build_item', to: 'cart#create'
  post  '/cart', to: 'cart#update_quantity'
  delete '/cart', to: 'cart#remove_item'
  get 'order/delivery', to: 'cart#delivery'

  resources :cart, only: [:index]

  get  '/register', to: 'users#register'
  post '/register', to: 'users#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  resources :tenants, path: '', param: :slug, except: [:index]

  namespace :tenants, as: :tenant, path: '/:slug' do

    get '/admin', to: 'admin/base_admin#index', as: :admin_index

    resources :orders, only: [:index, :new, :show, :create]

    namespace :admin do
      resources :items, :fillings, :users
      resources :orders, only: [:index, :show, :update]
    end

    put 'admin/remove_item', to: 'admin/orders#remove_item'
    post 'admin/update_quantity', to: 'admin/orders#update_quantity'


    get '/menu', to: 'menu#index'
    resources :menu, only: [:show]

    get '/code', to: 'application#code'

    get  '/build', to: 'line_items#index'
    get '/build_item/:id', to: 'line_items#build_item'
  end
end
