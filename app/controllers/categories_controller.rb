class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug(params[:slug])
    @products = Product.where(category_id: @category.id).paginate(:page => params[:page], :per_page => 8).order("price ASC")
  end
end
