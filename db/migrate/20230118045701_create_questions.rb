class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :caption
      t.integer :test_id
      t.integer :author_id
      t.integer :category_id
      t.string :question_type
      t.string :question_options
      t.integer :question_order

      t.timestamps
    end
  end
end
