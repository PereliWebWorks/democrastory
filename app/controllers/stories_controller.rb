class StoriesController < ApplicationController

	def index
		@stories = Story.all;
	end

	#Shows a single story and all it's parents/children. Also allows users to add a new child if it's the last child
	def show
	end

	def new_root
	end

	def new_child
	end

	def create
	end

end
