class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.text :content
      t.integer :parent_id
      t.integer :child_id
      t.integer :user_id
      t.integer :upvotes
      t.boolean :published

      t.timestamps
    end
  end
end
