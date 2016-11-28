class Vote < ApplicationRecord
  belongs_to :user_id
  belongs_to :story_id
end
