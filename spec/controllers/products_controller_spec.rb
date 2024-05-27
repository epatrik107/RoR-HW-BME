require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
RSpec.describe ProductsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        { product: { name: 'Test Product', descpription: 'Test description', price: 100, category_id: 15555} }
      end

      it 'creates a new product' do
        expect {
          post :create, params: valid_attributes
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(product_url(Product.last))
      end

      it 'sets a notice message' do
        post :create, params: valid_attributes
        expect(flash[:notice]).to eq('A termék sikeresen létrehozva.')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        { product: { name: 'xc', description: 'Test description', price: 100, category_id: 1 } }
      end

      it 'does not create a new product' do
        expect {
          post :create, params: invalid_attributes
        }.to_not change(Product, :count)
      end
end

