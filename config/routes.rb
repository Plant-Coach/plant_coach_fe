Rails.application.routes.draw do
  root 'welcome#index'
  constraints subdomain: 'plantCoach' do
    get '/dashboard', to: 'dashboard#index'
  end
end
