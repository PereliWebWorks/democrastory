
class Vote < ApplicationRecord
  validates_with VoteValidator

  belongs_to :user
  belongs_to :story
end



