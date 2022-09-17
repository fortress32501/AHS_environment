Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'sessions#home'
 
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "events#index"

  #Sessions routes
  get '/login', to: 'session#login'
  post '/login', to: 'session#create'
  post '/logout', to: 'session#destroy'
  get '/logout', to: 'session#destroy'

end
