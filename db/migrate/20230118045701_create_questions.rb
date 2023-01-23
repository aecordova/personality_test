class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :caption
      t.references :test, null: false, foreign_key: true
      t.integer :question_type, default: 0
      t.integer :question_order, default: 0
      t.string :settings

      t.timestamps
    end
  end
end
