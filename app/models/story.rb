class Story < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10 }

  belongs_to :story, optional: true
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  #ADD VALIDATION -- If the story is a root story 
  # it must have a title. And if it's a child story, make sure it's the child of a published story
  # AND there isn't a published sibling, meaning that no more continuations for the parent are being accepted because
  # a continuation has already been published
  def Story.publishThreshhold
    5
  end

  def parent
  	if self.story
  		self.story
  	else
  		nil
  	end
  end

  def children
  	Story.where(story_id: self.id)
  end

  def siblings
    Story.where("story_id = ? AND id <> ?", self.story.id, self.id)
  end

  def root
    rootStory = self #initialize root story with the story being shown
  	while rootStory.parent #While the paret is present, get it and set it to root
  		rootStory = rootStory.story
  	end
  	rootStory
  end

  def isLastPublishedInChain? #If this story has no published children, it's the last story in the chain
  	if self.published && self.children.where(published: true).count === 0
  		true
  	else
  		false
  	end
  end

  def destroySiblings
    self.siblings.destroy_all
  end

  def destroyVotes
    self.votes.destroy_all
  end

  def publish
    self.update(published: true)
    #kill the siblings
    self.destroySiblings
    #destroy votes, which are now needless data
    self.destroyVotes
  end

  def publishIfSufficientVotes
    if self.votes.count >= Story.publishThreshhold
      self.publish
    end
  end
end
