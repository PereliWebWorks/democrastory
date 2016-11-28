class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :story_id, presence: true
  validates_with 

  belongs_to :user
  belongs_to :story
end


class VoteValidator < ActiveModel::Validator
  def validate(record)
    if record.user.nil? #If the user Id is nil or corresponds to a non-existent user
    	record.errors[:base] << "Invalid user_id"
    elseif record.story.nil? #If the story Id is nil or corresponds to a non-existent story
    	record.errors[:base] << "Invalid story_id"
    else
    	#if the vote's story has a published child (meaning voting has closed)
    	#Or it's a vote on a published story (which should never happen)
		Story.where("parent_id = ? AND published = true", )
	end
  end
end
