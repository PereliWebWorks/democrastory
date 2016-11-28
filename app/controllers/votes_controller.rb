class VotesController < ApplicationController
	def create
		@vote
		if logged_in?
			@vote = Vote.new(story_id: params[:vote][:story_id])
			@vote.user_id = current_user.id
			if @vote.save
				redirect_to @vote.story_id
			end
		else
			redirect_to signup_path
		end
	end
end
