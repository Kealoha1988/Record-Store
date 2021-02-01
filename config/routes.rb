Rails.application.routes.draw do
  resources :genres
  resources :cassette_tapes
  resources :cds
  resources :records
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
