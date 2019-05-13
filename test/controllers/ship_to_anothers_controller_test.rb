require 'test_helper'

class ShipToAnothersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ship_to_anothers_new_url
    assert_response :success
  end

  test "should get create" do
    get ship_to_anothers_create_url
    assert_response :success
  end

  test "should get update" do
    get ship_to_anothers_update_url
    assert_response :success
  end

end
