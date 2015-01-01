class ListingWorker
  include Sidekiq::Worker
  def perform(photos, listing_id)
    photos.each do | photo |
      Photo.create!(:image => File.open(photo), :listing_id => listing_id)
      if !File.open(photo).nil?
        File.delete(photo)
      end
    end
  end
end
