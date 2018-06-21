require "rails_helper"
RSpec.describe Cart, type: :model do
  it { should have_many(:line_items) }
  context "validate methods" do
    let!(:category) { Category.create(name: "ct") }
    let!(:product1) { Product.create(name: "New", category: category, description: "No description", price: 6, image_url: "google.com") }
    let!(:product2) { Product.create(name: "New2", category: category, description: "No description", price: 6.5, image_url: "google.com") }

    it "Add product" do
      new_cart = Cart.new
      new_cart.add_product(1, 2)
      expect(new_cart.line_items.first.quantity).to eq(2)
    end

    it "total price" do
      new_cart = Cart.new
      new_cart.add_product(product1.id, 2)
      new_cart.add_product(product2.id, 1)
      x = product1.price * 2 + product2.price * 1
      expect(new_cart.total_price).to eq(x)
    end
  end
end
