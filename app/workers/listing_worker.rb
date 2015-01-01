class ListingWorker
  include Sidekiq::Worker
  def perform(photos, listing_id)
    photos.each do | photo |
      Photo.create!(:image => File.open(photo), :listing_id => listing_id)
    end
  end
end
