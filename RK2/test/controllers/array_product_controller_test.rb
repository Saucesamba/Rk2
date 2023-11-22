require "test_helper"

class ArrayProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get array_product_index_url
    assert_response :success
  end

  test "should get calculate" do
    get array_product_calculate_url
    assert_response :success
  end
end
