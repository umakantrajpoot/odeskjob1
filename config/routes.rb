Rails.application.routes.draw do

  root 'listings#index'

  # resources :videos
  # resources :photos
  resources :listings

end
