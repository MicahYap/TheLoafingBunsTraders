Rails.application.routes.draw do
  resources :trader_stocks
  root 'trader_stocks#index'

  resources :admin_dashboard, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      patch :approve
      delete :deny
    end
  end
  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :users do
    resources :trader_stocks, only: [:create, :destroy]
  end

  resources :stocks, only: [:index, :show]
end
