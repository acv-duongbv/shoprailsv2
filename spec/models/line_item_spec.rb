require "rails_helper"
RSpec.describe LineItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
  it { should belong_to(:order) }
  context "validate methods" do
    let!(:category) { Category.create(name: "ct") }
    let!(:product1) { Product.create(name: "New", category: category, description: "No description", price: 6, image_url: "google.com") }
    let!(:product2) { Product.create(name: "New2", category: category, description: "No description", price: 6.5, image_url: "google.com") }
    it "total price" do
      cart = Cart.new
      cart.save
      line_item = LineItem.new
      line_item.product_id = product1.id
      line_item.cart_id = cart.id
      line_item.quantity = 3
      line_item.save!
      expect(line_item.total_price).to eq(product1.price * 3)
    end
  end
end
