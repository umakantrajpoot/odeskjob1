class Listing < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  mount_uploader :video, VideoUploader

  has_many :photos, :dependent => :destroy
  has_many :videos, :dependent => :destroy

  accepts_nested_attributes_for :photos, :videos, :reject_if => :all_blank, allow_destroy: true

  def photo_changed?
  end

  def video_changed?
  end

end
