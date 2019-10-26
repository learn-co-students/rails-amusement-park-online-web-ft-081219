Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "/users/new", to: "users#new"

  resources :users, only: [:new, :create, :show]
  get '/signin', to: "users#signin"
  get "/logout", to: "sessions#logout"
  post "/signin", to: "users#login"
  root "application#home"

  


  resources :attractions, only: [:new,:create,:show,:index, :edit, :update, :destroy]

  resources :rides,only: [:create]
end
