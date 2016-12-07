class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :story, foreign_key: true, null: false

      t.timestamps
    end
  end
end
