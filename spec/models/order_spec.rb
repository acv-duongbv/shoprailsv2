require "rails_helper"
RSpec.describe Order, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:address) }
  it { should have_many(:line_items) }
  it { should belong_to(:user) }
  it { should validate_numericality_of(:phone_number) }
  context "validate mothods" do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 2, category: category) }
    let!(:cart) { create(:cart) }
    let!(:line_item1) { create(:line_item, product_id: products.first.id, cart_id: cart.id) }
    let!(:line_item2) { create(:line_item, product_id: products.second.id, cart_id: cart.id) }

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
