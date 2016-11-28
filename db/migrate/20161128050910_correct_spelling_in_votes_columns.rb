class CorrectSpellingInVotesColumns < ActiveRecord::Migration[5.0]
  def change
  	rename_column :votes, :story_id_id, :story_id
  	rename_column :votes, :user_id_id, :user_id
  end
end
