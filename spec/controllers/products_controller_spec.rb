require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "#index" do
    let!(:category) { Category.create(name: "ct") }
    let!(:product1) { Product.create(name: "New", category: category, description: "No description", price: 6, image_url: "google.com") }
    let!(:product2) { Product.create(name: "New2", category: category, description: "No description", price: 6.5, image_url: "google.com") }

    it "get a list product" do
      products = []
      products << product1
      products << product2
      get :index
      expect(assigns(:products)).to eq products
      expect(response).to render_template("index")
    end
  end
end
