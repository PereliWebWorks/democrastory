Rails.application.routes.draw do
  root 'stories#index'
  get 'sessions/new'
  get  '/signup',  to: 'users#new'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :stories, only: [:index, :show]
  get '/new_story', to: 'stories#new_root'
  post '/stories', to: 'stories#create'
  post '/votes', to: 'votes#create'
  delete '/votes', to: 'votes#destroy'
  resources :account_activations, only: [:edit]
end