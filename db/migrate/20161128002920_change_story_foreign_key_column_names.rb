class ChangeStoryForeignKeyColumnNames < ActiveRecord::Migration[5.0]
  def change
  	rename_column :stories, :parent_id_id, :parent_id
  	rename_column :stories, :user_id_id, :user_id
  end
end
