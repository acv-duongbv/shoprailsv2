require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let!(:category) { create(:category) }

  describe "#index" do
    it "get a list product" do
      products = []

      products << create(:product, category: category)
      products << create(:product, category: category)
      get :index
      expect(assigns(:products).count).to eq products.count
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    it "get a show product" do
      product1 = create(:product, category: category)
      get :show, params: {slug: product1.slug}
      expect(assigns(:product).name).to eq(product1.name)
      expect(response).to render_template("show")
    end
  end
end
