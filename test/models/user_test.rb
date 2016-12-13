require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without name" do
  	user = User.new(email: "example@example.com")
  	assert_not user.save
  end
  test "should not save user without email" do
	user = User.new(name: "Exampe_Name")
	assert_not user.save	
  end
end
