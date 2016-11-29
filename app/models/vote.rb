class VoteValidator < ActiveModel::Validator
  def validate(record)
    if record.user.nil? #If the user Id is nil or corresponds to a non-existent user
    	record.errors[:base] << "Invalid user_id" << 1
    elsif record.story.nil? #If the story Id is nil or corresponds to a non-existent story
    	record.errors[:base] << "Invalid story_id" << 2
    elsif record.user.hasVotedOn?(record.story) #if the user has already voted on this story (bad user, bad)
    	record.errors[:base] << "User already voted for this story" << 3
    elsif record.story.published # ifit's a vote on a published story (which should never happen)
    	record.errors[:base] << "Can't vote on published story" << 4
    elsif record.story.parent.children.where(published: true).count > 5
    	#if the vote's story has a published sibling (meaning voting has closed). (this shouldn't be possible anyway because siblings should be destroyed when a story is published, but just in case)
		record.errors[:base] << "This story has a published sibling"
	end
  end
end





class Vote < ApplicationRecord
  validates_with VoteValidator

  belongs_to :user
  belongs_to :story
end



