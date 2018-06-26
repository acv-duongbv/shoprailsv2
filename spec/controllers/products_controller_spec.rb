require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let!(:category) { create(:category) }
  let!(:products) { create_list(:product, 2, category: category) }
  describe "#index" do
    it "get a list product" do
      puts products
      get :index
      expect(assigns(:products).count).to eq products.count
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "get a show product" do
      get :show, params: {slug: products.first.slug}
      expect(assigns(:product).name).to eq(products.first.name)
      expect(response).to render_template("show")
    end
  end
end
