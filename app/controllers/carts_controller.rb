class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @line_items = LineItem.where(cart_id: @cart.id)
  end

  private

  def set_cart
    @cart = current_cart
  end
end
