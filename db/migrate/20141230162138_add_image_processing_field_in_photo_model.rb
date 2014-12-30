class AddImageProcessingFieldInPhotoModel < ActiveRecord::Migration
  def change
    add_column :photos, :photo_processing, :boolean, null: false, default: false
  end
end
