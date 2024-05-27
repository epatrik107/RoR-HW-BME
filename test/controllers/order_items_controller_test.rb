require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "should add product to cart when user is authenticated" do
    user = users(:one) 
    product = products(:one)
    sign_in user

    post :create, params: { order_item: { product_id: product.id, quantity: 1 } }
    assert_response :success
    assert_equal 'Product added to cart', JSON.parse(response.body)['message']
  end



  test "should redirect to sign in page when user is not authenticated" do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end

