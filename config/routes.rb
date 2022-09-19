Rails.application.routes.draw do

  root to: "sessions#new"

  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "events#index"

  # http://127.0.0.1:3000/sessions/new
  
  resources :users, only: [:new, :create, :index, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  get "/sessions/create", to: "sessions#new"  
  get "/sessions/destroy", to: "sessions#new"
  get "/users/edit", to: "sessions#new"
  # get "/users/destroy", to: "sessions#new"
  # get "/users/update", to: "sessions#new"
  # get "/users/new", to: "sessions#new"
  # get "/users/show", to: "sessions#new"
end
