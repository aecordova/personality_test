class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :author_id
      t.string :category_id

      t.timestamps
    end
  end
end
