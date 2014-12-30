class Photo < ActiveRecord::Base

  belongs_to :listing

  mount_uploader :image, PhotoUploader
  process_in_background :image, ListingWorker

end
