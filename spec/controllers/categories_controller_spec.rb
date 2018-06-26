require "rails_helper"
RSpec.describe CategoriesController, type: :controller do
  describe "#show" do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 2, category: category) }

    it "get list products of category" do
      get :show, params: {slug: category.slug}
      expect(assigns(:products).count).to eq products.count
      expect(response).to render_template("show")
    end
  end
end
