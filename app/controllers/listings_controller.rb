class ListingsController < ApplicationController

  def index
    @listings = Listing.order("updated_at DESC")
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
    photos = params[:listing][:image]
    params[:listing][:photos_attributes] = {}
    #~ photos.each_with_index do | photo, index |
      #~ img = {}
      #~ img["image"] = photo
      #~ params[:listing][:photos_attributes][index.to_s] = img
    #~ end

    #~ photos_name = []
    #~ photos.each do | photo |
      #~ photos_name << photo.path.split('tmp/')[1]
      #~ FileUtils.move(photo.path, "#{Rails.root}/tmp/uploads")
    #~ end

    @listing = Listing.new(listing_params)
    if @listing.save!
      photos_name = []
      tmp_directory = FileUtils.mkdir_p(File.join("#{Rails.root}/tmp/cache/uploads/#{@listing.class.to_s.underscore}/images/#{@listing.id}"), :mode => 0777)[0]
        photos.each do | photo |
        photos_name << photo.path.split('tmp/')[1]
        FileUtils.move(photo.path, tmp_directory)
      end

      ListingWorker.perform_async(tmp_directory, photos_name, @listing.id)
      redirect_to action: 'index', notice: 'Successfully created listing'
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

  def upload_photo_page
    @listing = Listing.where(:id => params[:listing_id]).first
  end

  def upload_photos
    @listing = Listing.where(:id => params[:listing_id]).first
    params[:photo] = {} if params[:photo].blank?
    params[:photo][:listing_id] = params[:listing_id].to_i
    params[:photo][:title] = params[:files][0].original_filename
    params[:photo][:image] = params[:files][0]
    if @listing.photos.create(photo_params)
      photos = @listing.photos.last
      respond_to do |format|
        format.html
        format.json { render json: {:success => true, photos: photos, :message => "Successfully uploaded photo"}}
      end
    end
  end

  def get_business_number
    @listing = Listing.where(:business_number => params[:business_number]).first
    respond_to do |format|
      format.html
      format.js
      format.json { render json: {:success => true, listing: listing}}
    end
  end

  private
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:business_name,
    :business_number, photos_attributes: [:id, :image, :title, :listing_id, :_destroy],
      videos_attributes: [:id, :vid, :title, :listing_id, :_destroy]
    )
  end

  def photo_params
    params.require(:photo).permit(:listing_id, :title, :image)
  end
end
