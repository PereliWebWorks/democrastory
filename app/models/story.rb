class Story < ApplicationRecord
  belongs_to :parent, optional: true
  belongs_to :user
end
