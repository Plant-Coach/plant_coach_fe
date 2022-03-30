Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  constraints subdomain: 'plantcoach' do
    get '/dashboard', to: 'dashboard#index' #, constraints: {subdomain: 'plantcoach'}
  end
end
