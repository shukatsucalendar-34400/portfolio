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
  resources :businesses,          only: [:create, :edit, :update, :index, :destroy]  
  resources :schedules,           only: [:create, :edit, :update, :destroy] 
  
  post 'ajax_select_business', to: 'schedules#ajax_select_business', as: 'ajax_select_business'
end
