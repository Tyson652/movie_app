require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get likes_user:references_url
    assert_response :success
  end

  test "should get movie:references" do
    get likes_movie:references_url
    assert_response :success
  end

end
