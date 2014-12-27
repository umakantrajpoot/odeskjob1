class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listings = Listing.all
    @listing = Listing.find(params[:id])
    @images = @listing.photos
    @videos = @listing.videos
  end

  def new
    @listing = Listing.new
    @listing.photos.build
    @listing.videos.build
  end

  def edit
    @listing = Listing.find(params[:id])
    @listing.photos.build
    @listing.videos.build
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save!
      redirect_to @listing
    else
      raise
      render action: 'new', notice: 'Something went wrong, Listing was not saved!'
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render action: 'edit', notice: 'Something went wrong, please try again...'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to action: 'index', notice: 'Listing was successfully deleted.'
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:business_name,
                                    :business_number,
                                    photos_attributes: [:id, :image, :title, :listing_id, :_destroy],
                                    videos_attributes: [:id, :vid, :title, :listing_id, :_destroy]
                                    )
  end

end
