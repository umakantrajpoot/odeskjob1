class Photo < ActiveRecord::Base

  belongs_to :listing

  mount_uploader :image, PhotoUploader

end
