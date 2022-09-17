Rails.application.routes.draw do

  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "events#index"

  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]

end
