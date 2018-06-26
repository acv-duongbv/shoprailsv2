require "rails_helper"
RSpec.describe LineItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
  it { should belong_to(:order) }
  context "validate methods" do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 2, category: category) }

    it "total price" do
      cart = Cart.new
      line_item = LineItem.new
      line_item.product_id = products.first.id
      line_item.cart_id = cart.id
      line_item.quantity = 3
      expect(line_item.total_price).to eq(products.first.price * 3)
    end
  end
end
