require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should create order item" do
    product = products(:one)
    order = orders(:one)

    assert_difference('OrderItem.count') do
      post :create, params: { order_item: { product_id: product.id, quantity: 2 } }
    end

    assert_response :success
    assert_equal 'Product added to cart', JSON.parse(response.body)['message']
  end

  test "should fail to create order item with invalid quantity" do
    product = products(:one)
    order = orders(:one)

    assert_no_difference('OrderItem.count') do
      post :create, params: { order_item: { product_id: product.id, quantity: 0 } }
    end

    assert_response :success
    assert_equal 'Failed to add product to cart', JSON.parse(response.body)['message']
  end
end

