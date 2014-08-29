class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.references :user
      t.references :location
      t.text :comment
      t.boolean :flagged, :default => false
      t.boolean :moderated, :default => false

      t.timestamps
    end
    add_index :questionnaires, :user_id
    add_index :questionnaires, :location_id
  end
end
