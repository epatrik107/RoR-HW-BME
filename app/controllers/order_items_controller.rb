class OrderItemsController < ApplicationController
  before_action :authenticate_user!



  def create
    @order = current_user.orders.find_or_create_by(status: 'pending')
    product = Product.find(params[:order_item][:product_id])
    order_item = @order.order_items.find_or_initialize_by(product: product)
    order_item.quantity = order_item.quantity.to_i + params[:order_item][:quantity].to_i
    order_item.subtotal = product.price * order_item.quantity

    if order_item.save
      render json: { success: true, message: 'Product added to cart' }
    else
      render json: { success: false, message: 'Failed to add product to cart' }
    end
  end

  def index
    @order = current_user.orders.find_by(status: 'pending')
    @order_items = @order.order_items.includes(:product)
  end
  
  
end

