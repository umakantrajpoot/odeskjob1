Rails.application.routes.draw do

  root 'listings#index'

  # resources :videos
  # resources :photos
  resources :listings do
    get :upload_photo_page
    post :upload_photos
  end

end
