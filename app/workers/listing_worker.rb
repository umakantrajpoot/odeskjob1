class ListingWorker
  include Sidekiq::Worker
  def perform(photos, listing_id)
    photos.each do | photo |
      Photo.create!(:image => File.open("#{Rails.root}/public/tmp/#{photo}"), :listing_id => listing_id)
      if !File.open("#{Rails.root}/public/tmp/#{photo}").nil?
        File.delete("#{Rails.root}/public/tmp/#{photo}")
      end
    end
  end
end
