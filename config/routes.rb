Rails.application.routes.draw do
  resources :users
  root to: 'main#index'

  resources :albums


  resources :stores do 
    resources :albums do
    patch'/add', to: 'albums#add' #for cart
  end
end
resources :artists, except: [:destroy]
resources :genres,  only: [:index, :show]



get '/login', to: 'sessions#login'
post '/login', to: 'sessions#create'
post '/logout', to: 'sessions#destroy'
get '/logout', to: 'sessions#destroy'

get '/user_login', to: 'sessions#user_login'
post '/user_login', to: 'sessions#user_create'

get '/cart', to: 'main#cart'
post '/cart', to: 'main#add_to_cart'
patch '/main/:id', to: 'main#remove'

get '/bouncer', to: "main#bouncer"

get '/most', to: "main#store_most"
  



  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get, :post]
  

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
