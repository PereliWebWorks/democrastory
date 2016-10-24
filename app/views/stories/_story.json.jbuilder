json.extract! story, :id, :content, :parent_id, :child_id, :user_id, :upvotes, :published, :created_at, :updated_at
json.url story_url(story, format: :json)