# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let!(:category) { create(:category) }
  let!(:product) { create(:product, category: category) }
  let!(:cart) { Cart.create() }
  let!(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id) }

  describe '#create' do
    it 'create a line item' do
      post :create, params: { product: { id: product.id, quantity: 4 } }
      expect(assigns(:line_items).total_price).to eq(product.price * 4)
      expect(:response).to redirect_to '/mycart'
    end
  end
  describe '#update' do
    it 'update a line item' do
      patch :update, params: { id: line_item.id, quantity: 5 }
      expect(response.status).to eq(200)
    end
  end

  describe '#destroy' do
    it 'delete a line item' do
      delete :destroy, params: { id: line_item.id }
      expect(response.status).to eq(302)
    end
  end
end
