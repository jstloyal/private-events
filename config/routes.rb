Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: %i[index new create show]
  resources :events
  
  resources :invitations, only: %i[create destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
