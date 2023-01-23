class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :response, null: false, foreign_key: true
      t.integer :score, null: false
      t.integer :max_possible_score, null: false
      t.integer :question_count, null: false
      t.integer :answer_count, null: false
      t.string :result, null: false

      t.timestamps
    end
  end
end
