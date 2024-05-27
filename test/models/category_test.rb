require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
test "should save category with name" do
    category = Category.new(name: "Test Category")
    assert category.save, "Failed to save the category with a name"
  end

  test "should have many products" do
    category = Category.new(name: "Test Category")
    assert_respond_to category, :products, "Category does not respond to products"
  end
end

