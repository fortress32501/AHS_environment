Rails.application.routes.draw do


  resources :admin_requests
  resources :event_types
  resources :attendances
  resources :rankings
  root to: "main#index"


  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "events#index"

  # http://127.0.0.1:3000/sessions/new
  
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy, :delete]
  
  get "/sessions/create", to: "sessions#new"  
  get "/sessions/destroy", to: "sessions#new"
  get "/users/edit", to: "sessions#new"
  # get "/users/destroy", to: "sessions#new"
  # get "/users/update", to: "sessions#new"
  # get "/users/new", to: "sessions#new"
  # get "/users/show", to: "sessions#new"

  # routes for admin requests
  get "/admin_requests/:id/approve", to: "admin_requests#approve", as: "approve"
  get "/admin_requests/:id/deny", to: "admin_requests#deny", as: "deny"

  # route to account page
  get "/accounts", to: "accounts#index"
  get "/history", to: "history#index"
end
