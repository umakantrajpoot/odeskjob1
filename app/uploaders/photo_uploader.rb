class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type

  if Rails.env.development? || Rails.env.test?

    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :thumb do
      process :resize_to_limit => [250, 250]
    end

    version :small do
      process :resize_to_limit => [500, 500]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

  else

    storage :fog

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :thumb do
      process :resize_to_limit => [250, 250]
    end

    version :small do
      process :resize_to_limit => [500, 500]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

  end

end
