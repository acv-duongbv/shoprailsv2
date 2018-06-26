require "rails_helper"
RSpec.describe LineItemsController, type: :controller do
  let!(:category) { create(:category) }
  let!(:products) { create_list(:product, 2, category: category) }
  let!(:cart) { create(:cart) }
  let!(:line_item1) { create(:line_item, product_id: products.first.id, cart_id: cart.id) }

  describe "#create" do
    it "create a line item" do
      cart = Cart.new
      post :create, params: {product: {id: products.first.id, quantity: 4}}
      expect(assigns(:line_items).total_price).to eq(products.first.price * 4)
      expect(:response).to redirect_to "/mycart"
    end
  end

  describe "#update" do
    it "update a line item" do
      patch :update, params: {id: line_item1.id, quantity: 5}
      expect(response.status).to eq(200)
    end
  end

  describe "#destroy" do
    it "delete a line item" do
      delete :destroy, params: {id: line_item1.id}
      expect(response.status).to eq(302)
    end
  end
end
