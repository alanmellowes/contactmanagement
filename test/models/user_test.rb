require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "shouldnt save user without password" do
     user = user.new
     assert user.save
   end
end
