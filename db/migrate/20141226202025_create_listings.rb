class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

      t.string           :business_name,    null: false, default: ""
      t.string           :business_number,  null: false, default: ""

      t.timestamps null: false
    end
    add_index :listings, :business_number,         unique: true
  end
end
