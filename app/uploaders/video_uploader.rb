class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::MimeTypes

  process :set_content_type

  def move_to_cache
    true
  end
  def move_to_store
    true
  end

  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(mp4 m4v)
  end
end
