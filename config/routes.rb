Rails.application.routes.draw do
  root 'secured_assets#index'

  resources :secured_assets
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
end
