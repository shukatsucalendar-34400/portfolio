Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  root 'sessions#new'
 
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  post   '/',        to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
end
