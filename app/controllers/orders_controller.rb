class OrdersController < ApplicationController
  def new
    @cart = current_cart
    if @cart.line_items.blank?
      redirect_to root_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to show_order_path, notice: "Thông tin của bạn đã được lưu"
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone_number, :address)
  end
end
