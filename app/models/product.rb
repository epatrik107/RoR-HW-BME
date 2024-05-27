class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :destroy
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    has_one_attached :image
end
