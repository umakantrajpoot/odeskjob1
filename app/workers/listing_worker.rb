class ListingWorker
  include Sidekiq::Worker
  def perform(tmp_directory, photos, listing_id)
    photos.each do | photo |
      Photo.create!(:image => File.open(File.join(tmp_directory, photo)), :listing_id => listing_id)
    end
    if File.directory?(tmp_directory)
      FileUtils.rm_r(tmp_directory, :force => true)
    end
  end
end
