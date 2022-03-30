Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :plantcoach, only: [:index]
  resources :dashboard, only: [:index]
end
