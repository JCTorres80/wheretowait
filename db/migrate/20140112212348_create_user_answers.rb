class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.references :question
      t.decimal :value
      t.references :questionnaire
      t.references :location

      t.timestamps
    end
    add_index :user_answers, :question_id
    add_index :user_answers, :questionnaire_id
    add_index :user_answers, :location_id
  end
end
