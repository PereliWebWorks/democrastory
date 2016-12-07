class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :contet, null: false
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true, null: false
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
