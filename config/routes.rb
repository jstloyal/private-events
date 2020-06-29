Rails.application.routes.draw do
  root 'users#show'
  resources :users, only: %i[new create show destroy]
  resources :events, only: %i[new create show index]
end
