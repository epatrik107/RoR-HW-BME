require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @product = products(:one)
  end

  test "should get show" do
    order = @user.orders.create
    get :show, params: { id: order.id }
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count',2) do
      post :create, params: { order: { user_id: @user.id } }
    end

    assert_redirected_to order_path(assigns(:order))
  end

 


end

