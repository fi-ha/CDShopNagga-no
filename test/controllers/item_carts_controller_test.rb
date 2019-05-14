require 'test_helper'

class ItemCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get item_carts_create_url
    assert_response :success
  end

  test "should get update" do
    get item_carts_update_url
    assert_response :success
  end

end
