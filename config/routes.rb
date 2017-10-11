Rails.application.routes.draw do
  devise_for :models

  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      namespace :authentication do
        # put 'omniauth/:provider' => 'omniauth#omniauth'
        # patch 'omniauth/:provider' => 'omniauth#omniauth'
        post 'passwords' => 'passwords#create'
        patch 'passwords' => 'passwords#update'
        put 'passwords' => 'passwords#update'
        # post 'registrations' => 'registrations#create'
        # delete 'registrations' => 'registrations#destroy'
        post 'sessions' => 'sessions#create'
        delete 'sessions' => 'sessions#destroy'
      end
      resources :customers, only: [:index, :show]
      resources :orders, only: [:create, :index, :show]
      get 'shirt-options' => 'shirt_options#index'
      post 'payments' => 'payments#create'
      get 'seller_orders' => 'seller_orders#index'
    end
  end
  # mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds
  resources :empresas
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
