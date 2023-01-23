class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :audience, default: 0
      t.integer :status, default: 0
      t.string :calculation_type

      t.timestamps
    end
  end
end
