require "rails_helper"
RSpec.describe OrdersController, type: :controller do
  let!(:order) { create(:order) }
  let!(:category) { create(:category) }
  let!(:product) { create(:product, category: category) }
  let!(:cart) { create(:cart) }
  let!(:line_item) { create(:line_item, product_id: product.id, cart_id: cart.id) }
  describe "#show" do
    it "show a order" do
      order.add_line_item_from_cart(cart)
      get :show, params: {order_no: order.order_no}
      expect(assigns(:line_items).count).to eq (1)
    end
  end
end
