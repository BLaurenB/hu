Rails.application.routes.draw do

  root "welcome#index"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/dashboard', to: 'dashboard#index'

  resources :sessions, only: [:create, :destroy]
  resources :welcome, only: [:index]

  resources :ventures, only: [:index, :show, :new, :create, :update, :destroy]
  resources :terms, only: [:index, :show, :new, :create, :update, :destroy]



end
