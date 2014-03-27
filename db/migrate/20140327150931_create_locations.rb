class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :website
      t.string :photo_url
    end
  end
end
