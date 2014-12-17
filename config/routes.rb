Rails.application.routes.draw do
  resources :tenants, path: '', param: :slug

  namespace :tenants, as: :tenants, path: '/:slug' do

    get '/admin', to: 'admin/base_admin#index', as: :admin_index

    resources :users
    resources :orders, only: [:index, :new, :show, :create]

    namespace :admin do
      resources :items, :fillings, :users
      resources :orders, only: [:index, :show, :update]
    end

    put 'admin/remove_item', to: 'admin/orders#remove_item'
    post 'admin/update_quantity', to: 'admin/orders#update_quantity'

    get    '/login',  to: 'sessions#new'
    post   '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/menu', to: 'menu#index'
    resources :menu, only: [:show]

    get  '/register', to: 'users#register'
    post '/register', to: 'users#create'

    get '/code', to: 'application#code'

    get  '/build', to: 'line_items#index'
    get '/build_item/:id', to: 'line_items#build_item'

    post '/build_item', to: 'cart#create'
    post  '/cart', to: 'cart#update_quantity'
    delete '/cart', to: 'cart#remove_item'
    get 'order/delivery', to: 'cart#delivery'

    resources :cart, only: [:index]
  end

  root 'home#index'

end
