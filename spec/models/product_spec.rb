require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: 'Pizza') }

  it 'is valid with a name, description, price and category' do
    product = Product.new(
      name: 'Margherita',
      descpription: 'Tomato, mozzarella, basil',
      price: 1000,
      category: category
    )
    expect(product).to be_valid
  end

  it 'is invalid without a name' do
    product = Product.new(name: nil)
    expect(product).not_to be_valid
  end

  it 'is invalid without a price' do
    product = Product.new(price: nil)
    expect(product).not_to be_valid
  end
end

