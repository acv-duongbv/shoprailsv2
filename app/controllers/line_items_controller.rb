class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    puts @cart.id
  end
end
