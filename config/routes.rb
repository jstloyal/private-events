Rails.application.routes.draw do
  root 'users#show'
  resources :users
end
