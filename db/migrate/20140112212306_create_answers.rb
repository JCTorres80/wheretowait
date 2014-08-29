class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.decimal :value

      t.timestamps
    end
  end
end
