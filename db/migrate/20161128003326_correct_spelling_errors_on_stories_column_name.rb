class CorrectSpellingErrorsOnStoriesColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :stories, :contet, :content
  end
end
