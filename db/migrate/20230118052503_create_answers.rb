class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
      t.integer :response_id
      t.integer :responder_id

      t.timestamps
    end
  end
end
