require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @product = products(:one)
  end

  test "should get home page" do
    get root_path
    assert_response :success
  end

  test "should get about page" do
    get home_about_path
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count',2) do
      post orders_path, params: { order: { user_id: @user.id } }
    end

    assert_redirected_to order_path(assigns(:order))
    assert_equal 'A rendelésed sikeresen leadva!', flash[:notice]
  end
end

