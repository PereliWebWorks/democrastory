class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :story_id, presence: true

  belongs_to :user_id
  belongs_to :story_id
end
