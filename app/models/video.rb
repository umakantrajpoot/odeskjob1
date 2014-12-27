class Video < ActiveRecord::Base

  belongs_to :listing

  mount_uploader :vid, VideoUploader

end
