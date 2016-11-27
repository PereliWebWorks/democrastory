class Story < ApplicationRecord
  belongs_to :parent_id
  belongs_to :user_id
end
