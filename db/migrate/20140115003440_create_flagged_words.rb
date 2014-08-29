class CreateFlaggedWords < ActiveRecord::Migration
  def change
    create_table :flagged_words do |t|
      t.string :word
      t.timestamps
    end
  end
end
