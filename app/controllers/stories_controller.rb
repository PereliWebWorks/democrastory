class StoriesController < ApplicationController

	def index
		@stories = Story.where(parent_id: nil).order("created_at DESC") #Only show top level stories
	end

	#Shows a single story and all it's parents/children. Also allows users to add a new child if it's the last child
	def show
		@stories = [Story.find(params[:id]).root] #Add the root story as the first item in the stories array
		currentChildren = @stories[-1].children
		while currentChildren.count === 1 && currentChildren[0].published #while the last element in the stories array has a published child 
			@stories.push(currentChildren[0])
			currentChildren = @stories[-1].children
		end
		#Add all the children of the last story to "unpublished children"
		@unpublishedChildren = @stories[-1].children.shuffle
		#send a new story along for the form, with the parent_id set to the id of the last published story in the chain
		@newStory = Story.new(parent_id: @stories[-1].id)
		#send a vote as well
		@vote = Vote.new()
	end

	def new_root
		if logged_in?
			@story = Story.new(published: true)
		else
			redirect_to "users#new"
		end
	end

	def new_child
	end

	def create
		@story = Story.new(story_params)
		@story.user_id = current_user.id
		if @story.save
			redirect_to @story
		else
			redirect_to new_story_path
		end
	end



	private
		def story_params
			params.require(:story).permit(:title, :content, :parent_id, :user_id, :published)
		end
end





