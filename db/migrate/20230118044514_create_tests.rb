class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :author_id
      t.integer :audience, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
