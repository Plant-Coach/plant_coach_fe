Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :plantcoach, only: [:index]
  # constraints subdomain: 'plantcoach' do
  #   get '/dashboard', to: 'dashboard#index' #, constraints: {subdomain: 'plantcoach'}
  # end
  # constraints subdomain: 'shop' do
  #   get '/dashboard', to: 'dashboard#index'
  # end
end
