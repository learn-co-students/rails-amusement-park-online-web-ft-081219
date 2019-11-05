Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :user

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  resources :attractions
  
  post '/attractions/:id', to: 'attractions#ride'

  

end