Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  get '/dashboard', to: 'dashboard#index', constraints: {subdomain: 'plantcoach'}
end
