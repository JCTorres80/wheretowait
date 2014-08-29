class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answer_type
      t.string :group
      t.string :unit, :default => ''
      t.string :sub_group
      t.string :sub_group_unit, :default => ''

      t.timestamps
    end
  end
end
