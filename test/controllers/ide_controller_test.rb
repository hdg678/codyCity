require 'test_helper'

class IdeControllerTest < ActionDispatch::IntegrationTest
  test "should get IDE" do
    get ide_IDE_url
    assert_response :success
  end

end
