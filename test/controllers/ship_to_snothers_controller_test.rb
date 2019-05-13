require 'test_helper'

class ShipToSnothersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ship_to_snothers_new_url
    assert_response :success
  end

  test "should get create" do
    get ship_to_snothers_create_url
    assert_response :success
  end

  test "should get update" do
    get ship_to_snothers_update_url
    assert_response :success
  end

end
