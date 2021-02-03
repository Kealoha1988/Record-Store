Rails.application.routes.draw do
  root to: 'main#index'


  resources :stores do 
    resources :albums
  end
  resources :artists
  resources :genres

  # resources :sessions, only: [:create, :destroy]

  get 'login', to: 'sessions#login'
  post '/login', to: 'sessins#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
