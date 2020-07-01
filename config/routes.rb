Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: %i[index new create show]
  resources :events
  resources :sessions, only: %i[new create destroy]
  resources :invitations, only: %i[create destroy]
end
