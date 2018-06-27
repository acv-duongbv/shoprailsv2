# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:category) { create(:category) }
  let!(:products) { create_list(:product, 2, category: category) }
  describe '#show' do
    it 'get current cart' do
      current_cart = Cart.create
      session[:cart_id] = current_cart.id
      get :show
      expect(assigns(:cart).id).to eq(current_cart.id)
      expect(response).to render_template('show')
    end
  end
end
