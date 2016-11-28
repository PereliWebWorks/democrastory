class VotesController < ApplicationController
	def create
		if logged_in?
			@vote = Vote.new(story_id: params[:vote][:story_id])
			@vote.user_id = current_user.id
			if @vote.save #If the vote is valid
				redirect_to Story.find(@vote.story.parent_id) #redirect to the story being continued
			else
				redirect_to signup_path
			end
		else
			redirect_to signup_path
		end
	end
end
