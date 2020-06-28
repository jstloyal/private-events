Rails.application.routes.draw do
  root 'users#show'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
