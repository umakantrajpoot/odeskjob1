class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :listing, index: true
      t.string :vid
      t.string :title

      t.integer         :listing_id
      t.timestamps
    end
  end
end
