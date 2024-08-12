Rails.application.routes.draw do
  resources :trader_stocks do
    member do
      post 'buy'
    end
  end

  root 'trader_stocks#index'

  resources :admin_dashboard do
    member do
      patch :approve
      delete :deny
      get :trader_stocks, as: 'trader_stocks'
    end
  end
  
  get 'admin_dashboard/pending_traders', to: 'admin_dashboard#pending_traders', as: 'pending_traders_admin_dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :users do
    resources :trader_stocks, only: [:create, :destroy]
  end

  resources :stocks, only: [:index, :show]
end
