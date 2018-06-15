class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    puts params
    product = Product.find_by_slug(params[:format])
    @line_items = @cart.add_product(product.id)
    if @line_items.save!
      redirect_to("/mycart", :notice => "Thêm vào giỏ hàng thành công")
    end
  end

  def update
    attributes = params_line.clone
    @line = LineItem.find(params[:id])
    @line.update_attributes!(attributes)
    respond_to do |format|
      format.json { head :ok }
      format.html { head :ok }
      format.js
    end
  end

  def destroy
    puts params
    @line = LineItem.find(params[:id])
    @line.destroy!
    redirect_to cart_path
  end

  private

  def params_line
    params.permit(:id, :quantity)
  end
end
