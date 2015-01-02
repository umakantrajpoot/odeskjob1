class ListingWorker
  include SuckerPunch::Job

  def perform(photos, listing_id)
    photos.each do | photo |
      Photo.create!(:image => photo, :listing_id => listing_id)
    end
  end

end
