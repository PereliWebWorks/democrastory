class ChangeUserIdDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :stories, :user_id, 0
  end
end
