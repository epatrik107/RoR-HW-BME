require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  it 'is valid with a user and status' do
    order = Order.new(user: user, status: 'pending')
    expect(order).to be_valid
  end

  it 'is invalid without a user' do
    order = Order.new(user: nil)
    expect(order).not_to be_valid
  end

  it 'is invalid without a status' do
    order = Order.new(status: nil)
    expect(order).not_to be_valid
  end
end

