Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :plantcoach, only: [:index]
  resources :dashboard, only: [:index]
  resources :plants, only: [:index, :new, :create]
  resources :user_plants, only: [:create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
