require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @order = orders(:one)
  end

  test "should create order" do
    user = users(:one)
    sign_in user
    assert_difference('Order.count', 2) do
      post :create, params: { order: { user_id: user.id } }
    end

    assert_redirected_to order_path(assigns(:order))
  end


end

