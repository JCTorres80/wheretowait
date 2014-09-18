class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.date :open_date
      t.string :website
      t.string :location_type
      t.text :search_string

      t.timestamps
    end
    add_index :locations, :name
    add_index :locations, :search_string
    add_index :locations, :address
    add_index :locations, :city
    add_index :locations, :state
    add_index :locations, :zip_code
    add_index :locations, :website
  end
end
