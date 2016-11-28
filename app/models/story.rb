class Story < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10 }

  belongs_to :parent, optional: true
  belongs_to :user
  has_many :users, through: :votes
end
