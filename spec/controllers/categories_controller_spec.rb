require "rails_helper"
RSpec.describe CategoriesController, type: :controller do
  describe "#show" do
    let!(:category) { create(:category) }
    let!(:product1) { create(:product, category: category) }
    let!(:product2) { create(:product, category: category) }

    it "get list products of category" do
      products = []
      products << product1
      products << product2
      get :show, params: {slug: category.slug}
      expect(assigns(:products)).to eq products
      expect(response).to render_template("show")
    end
  end
end
