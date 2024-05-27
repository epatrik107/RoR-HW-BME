require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @product = products(:one)
  end



  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @product }
    assert_response :success
  end

  test "should update product" do
    patch :update, params: { id: @product, product: { name: @product.name, descpription: @product.descpription, price: @product.price, category_id: @product.category_id } }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, params: { id: @product }
    end

    assert_redirected_to products_path
  end
end

