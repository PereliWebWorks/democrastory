class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :contet
      t.references :parent_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
