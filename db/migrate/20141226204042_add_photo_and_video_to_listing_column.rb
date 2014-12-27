class AddPhotoAndVideoToListingColumn < ActiveRecord::Migration
  def change
    add_column :listings, :image, :string
    add_column :listings, :vid, :string
  end
end
