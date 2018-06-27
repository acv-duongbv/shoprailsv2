# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:line_items) }
  context 'validate methods' do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 2, category: category) }
    it 'Add product' do
      new_cart = Cart.new
      new_cart.add_product(1, 2)
      expect(new_cart.line_items.first.quantity).to eq(2)
    end

    it 'total price' do
      new_cart = Cart.new
      new_cart.add_product(products.first.id, 2)
      new_cart.add_product(products.second.id, 1)
      total_price = products.first.price * 2 + products.second.price * 1
      expect(new_cart.total_price).to eq(total_price)
    end
  end
end
