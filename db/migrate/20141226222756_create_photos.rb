class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :listing, index: true
      t.string :image
      t.string :title

      t.integer         :listing_id
      t.timestamps
    end
  end
end
