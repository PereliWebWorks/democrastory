require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "should not save vote without user_id" do
  	vote = Vote.new
  	assert_not vote.save
  end
end
