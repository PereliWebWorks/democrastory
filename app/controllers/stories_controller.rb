class StoriesController < ApplicationController

	def index
		@stories = Story.where(parent_id: nil) #Only show top level stories
	end

	#Shows a single story and all it's parents/children. Also allows users to add a new child if it's the last child
	def show
		rootStory = Story.find(params[:id]) #initialize root story with the story being shown
		while rootStory.parent_id.present? #While the paret is present, get it and set it to root
			rootStory = Story.find(rootStory.parent_id)
		end
		@stories = [rootStory] #Add the root story as the first item in the stories array
		currentStory = Story.find_by(parent_id: @stories[-1].id)
		while currentStory && currentStory.published #while the last element in the stories array has a published child 
			@stories.push(currentStory)
			currentStory = Story.find_by(parent_id: @stories[-1].id)
		end
		#Add all the children of the last story to "unpublished children"
		@unpublishedChildren = Story.where(parent_id: @stories[-1].id).shuffle
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





