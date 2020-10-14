require 'test_helper'

class CommercialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commercial_index_url
    assert_response :success
  end

end
