class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  enum status: { pending: 'pending', completed: 'completed' }

  def total_price
    order_items.sum('quantity * subtotal')
  end
end

