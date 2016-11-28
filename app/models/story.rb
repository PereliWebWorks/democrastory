class Story < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10 }

  belongs_to :parent, optional: true
  belongs_to :user
  has_many :users, through: :votes
  #ADD VALIDATION -- If the story is a root story 
  # it must have a title. And if it's a child story, make sure it's the child of a published story
  # AND there isn't a published sibling, meaning that no more continuations for the parent are being accepted because
  # a continuation has already been published
  def parent
  	if self.parent_id
  		Story.find(self.parent_id)
  	else
  		nil
  	end
  end
end
