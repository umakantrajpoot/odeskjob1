
Rails.application.routes.draw do
  require 'sinatra/base'
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
  root 'listings#index'

  # resources :videos
  # resources :photos
  resources :listings do
    get :upload_photo_page
    post :upload_photos
    get :get_business_number, on: :collection
  end

end
