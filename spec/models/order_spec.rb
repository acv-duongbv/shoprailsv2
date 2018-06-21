require "rails_helper"
RSpec.describe Order, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:address) }
  it { should have_many(:line_items) }
  it { should belong_to(:user) }
  it { should validate_numericality_of(:phone_number) }
  context "validate mothods" do
    let!(:category) { Category.create(name: "ct") }
    let!(:product1) { Product.create(name: "New", category: category, description: "No description", price: 6, image_url: "google.com") }
    let!(:product2) { Product.create(name: "New2", category: category, description: "No description", price: 6.5, image_url: "google.com") }
    let!(:cart) { Cart.create() }
    let!(:line_item1) { LineItem.create(product_id: product1.id, cart_id: cart.id, quantity: 3) }
    let!(:line_item2) { LineItem.create(product_id: product2.id, cart_id: cart.id, quantity: 6) }
    it "total price" do
      order = Order.new(name: "Duong", phone_number: "0955333333", address: "zxckjhasdkhasjk")
      order.save!
      line_item1.order_id = order.id
      line_item2.order_id = order.id
      line_item1.save
      line_item2.save
      expect(order.total_price).to eq(line_item1.total_price + line_item2.total_price)
    end
  end
end
