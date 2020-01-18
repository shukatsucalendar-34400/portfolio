Rails.application.routes.draw do
  root 'sessions#new'
 
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  post   '/',        to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
end
