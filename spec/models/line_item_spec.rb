# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
  it { should belong_to(:order) }
  context 'validate methods' do
    let!(:category) { create(:category) }
    let!(:product) { create(:product, category: category) }
    let!(:cart) { Cart.create }
    let!(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id) }
    it 'total price' do
      expect(line_item.total_price).to eq(product.price * line_item.quantity)
    end
  end
end
