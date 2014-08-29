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

      t.timestamps
    end
  end
end
