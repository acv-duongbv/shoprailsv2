class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    puts params
    product = Product.find_by_slug(params[:format])
    @line_items = @cart.add_product(product.id)
    if @line_items.save!
      redirect_to("/", :notice => "Line item was successfully created")
    else
      render :new
    end
  end
end
