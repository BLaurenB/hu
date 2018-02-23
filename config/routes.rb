Rails.application.routes.draw do

  root "welcome#index"
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:show, :index]

  resources :ventures, only: [:index]

end
