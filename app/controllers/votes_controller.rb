class VotesController < ApplicationController
	def create
		if logged_in?
			@vote = Vote.new(story_id: params[:vote][:story_id])
			@vote.user_id = current_user.id
			if @vote.save #If the vote is valid
				redirect_to @vote.story.parent #redirect to the story being continued
			else
				errorNumber = @vote.errors.messages[:base][1]
				if errorNumber === 1 #Invalid user/user not signed in
					redirect_to signup_path
				elsif errorNumber === 2#Invalid story
					redirect_to root_path
				elsif errorNumber === 3 #User already voted on this story
					redirect_to @vote.story.parent
				else
					redirect_to @vote.story.parent
				end
			end
		else
			redirect_to signup_path
		end
	end

	def destroy
		vote = Vote.find_by(story_id: params[:vote][:story_id])
		if vote	
			vote.user_id = current_user.id
			vote.destroy
		end
		redirect_to Story.find(params[:vote][:story_id]).parent
	end
end
