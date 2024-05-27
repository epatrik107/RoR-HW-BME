class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :add, :remove]

  def show
    order_items = @order.order_items.includes(:product)
    @order_items = Kaminari.paginate_array(order_items).page(params[:page]).per(4)
    @total_price = @order.order_items.sum { |order_item| order_item.product.price * order_item.quantity }
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      clear_cart 
      redirect_to @order, notice: "A rendelésed sikeresen leadva!"
    else
      render :new
    end
  end

  def add
    product = Product.find(params[:product_id])
    order_item = @order.order_items.find_or_initialize_by(product: product)
    order_item.quantity = order_item.quantity.to_i + 1
    order_item.subtotal = product.price * order_item.quantity
    if order_item.save
      redirect_to order_path(@order), notice: 'Product added to cart'
    else
      redirect_to product_path(product), alert: 'Unable to add product to cart'
    end
  end

  def remove
    product = Product.find(params[:product_id])
    @order_item = @order.order_items.find_by(product: product)
    if @order_item
      quantity_to_remove = params[:order_item][:quantity].to_i
      if quantity_to_remove >= @order_item.quantity
        @order_item.destroy
      else
        @order_item.quantity -= quantity_to_remove
        @order_item.save
      end
      redirect_to order_path(@order), notice: 'Product removed from cart'
    else
      redirect_to order_path(@order), alert: 'Product not found in cart'
    end
  end

  private
  
  def order_params
    params.require(:order).permit(:user_id, :order_date)
  end
  
  def clear_cart
    current_user.orders.find_or_create_by(status: 'pending').order_items.destroy_all
  end

  def set_order
    @order = current_user.orders.find_or_create_by(status: 'pending')
  end
end

