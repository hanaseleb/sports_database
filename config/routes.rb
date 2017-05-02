Rails.application.routes.draw do
  resources :injuries
  get 'reports/index/:id', to: 'reports#index', as: 'reports_index'
  get 'injuries/index/:id', to: 'injuries#injuries_index', as: 'injuries_index'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  resources :muscles
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'muscles#index'
  get '/user_muscle/:id', to: 'muscles#user_muscle', as: 'user_muscle'
  get '/admin', to: 'muscles#admin_user', as: 'admin'
  get '/all_muscle', to: 'muscles#all_muscle', as: 'all_muscle'
  get '/all_injury', to: 'injuries#all_injury', as: 'all_injury'
  get '/all_report', to: 'reports#all_report', as: 'all_report'
end
