class SetDefaults < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :stories, :parent_id, -1
  	change_column_default :stories, :upvotes, 0
  	change_column_default :stories, :published, false
  end
end
