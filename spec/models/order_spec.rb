# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:address) }
  it { should have_many(:line_items) }
  it { should belong_to(:user) }
  it { should validate_numericality_of(:phone_number) }

  context 'validate mothods' do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 2, category: category) }
    let!(:cart) { Cart.create }
    let!(:order) { create(:order) }
    let!(:line_item1) do
      create(:line_item,
             product_id: products.first.id,
             cart_id: cart.id,
             order_id: order.id)
    end

    let!(:line_item2) do
      create(:line_item,
             product_id: products.second.id,
             cart_id: cart.id,
             order_id: order.id)
    end
    it 'total price' do
      expect(order.total_price).to eq(line_item1.total_price + line_item2.total_price)
    end
  end
end
