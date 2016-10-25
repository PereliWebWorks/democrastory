Rails.application.routes.draw do
  get 'users/new'

  root 'stories#index'
  resources :stories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
