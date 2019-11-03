Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update] do 
    resources :rides, only: [:create]
  end

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
