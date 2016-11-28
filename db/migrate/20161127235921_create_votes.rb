class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user_id, foreign_key: true, null: false
      t.references :story_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
