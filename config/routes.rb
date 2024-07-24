Rails.application.routes.draw do
  root 'secured_assets#index'

  resources :secured_assets
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end
