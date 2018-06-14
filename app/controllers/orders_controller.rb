class OrdersController < ApplicationController
  before_action :set_current_cart, only: [:index, :new]

  def index
  end

  def new
    if @cart.line_items.blank?
      redirect_to root_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_item_from_cart(current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to show_order_path, notice: "Thông tin của bạn đã được lưu"
    else
      render :new
    end
  end

  private

  def set_current_cart
    @cart = current_cart
  end

  def order_params
    params.require(:order).permit(:name, :phone_number, :address)
  end
end
