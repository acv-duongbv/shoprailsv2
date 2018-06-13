class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @line_items = LineItem.where(cart_id: @cart.id)
    @line = LineItem.new
  end

  private

  def set_cart
    @cart = current_cart
  end
end
