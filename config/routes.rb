Rails.application.routes.draw do
  root 'welcome#index'

  get '/dashboard', to: 'dashboard#index', constraints: {subdomain: 'plantcoach'}
end
