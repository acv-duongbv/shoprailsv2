
class ProductsController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 8).order("price ASC")
  end

  def show
    @product = Product.find_by_slug(params[:slug])
  end
end
