Rails.application.routes.draw do
  root 'users#show'
  resources :users, only: %i[new create show]
  resources :events, only: %i[new create show index]
  resources :sessions, only: %i[new create destroy]
end
