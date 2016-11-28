class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :story_id, presence: true

  belongs_to :user
  belongs_to :story
end
