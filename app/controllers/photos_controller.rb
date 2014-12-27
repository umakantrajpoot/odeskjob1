class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save!
      redirect_to @photo, notice: 'Listing was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update
      redirect_to @photo, notice: 'Photo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_url, notice: 'Photo was successfully deleted.'
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:listing_id, :title, :image, :image_cache)
    end

end
