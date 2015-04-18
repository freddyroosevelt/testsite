require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(username: "bob", email: "bob@info.com")
    @post = @user.posts.build(name: "chicken parm", summary: "this is a post about chicken parm", 
            description: "heat oil, blah balh blah, and some more text ok")
  end
  
  test "post should be vaild" do
    assert @post.valid?
  end
  
  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  
  test "name should be present" do
    @post.name = " "
    assert_not @post.valid?
  end
  
  test "name length should not be too long" do
    @post.name = "a" * 101
    assert_not @post.valid?
  end
  
  test "name length should not be too short" do
    @post.name = "aaaa"
    assert_not @post.valid?
  end
  
  test "summary should be present" do
    @post.summary = " "
    assert_not @post.valid?
  end
  
  test "summary length should not be too long" do
    @post.summary = "a" * 151
    assert_not @post.valid?
  end
  
  test "summary length should not be too short" do
    @post.summary = "a" * 9
    assert_not @post.valid?
  end
  
  test "description must be present" do
    @post.description = " "
    assert_not @post.valid?
  end
  
  test "description should not be too long" do
    @post.description = "a" * 501
    assert_not @post.valid?
  end
  
  test "description should not be too short" do
    @post.description = "a" * 19
    assert_not @post.valid?
  end
  
  
end