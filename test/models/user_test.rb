require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    user = User.new(id: 201, email: "test4@test1.com",  password: '12345678')
    assert user.save
  end
end
