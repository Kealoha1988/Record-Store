Rails.application.routes.draw do
  resources :stores do 
    resources :albums
  end
  resources :artists
  resources :genres

  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
