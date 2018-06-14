class OrdersController < ApplicationController
  before_action :set_current_cart, only: [:index, :new]
  protect_from_forgery except: [:hook]

  def hook
    params.permit!
    status = params[:payment_status]
    @order = Order.find(params[:invoice])
    if status == "Completed"
      @order.update_attributes notification_params: params, status: "paid", transaction_id: params[:txn_id], purchased_at: Time.now
    end
    respond_to do |format|
      format.json { head :ok }
      format.html { head :ok }
      format.js
    end
  end

  def show
    @order = Order.find_by_order_no(params[:order_no])
    if @order.nil?
      redirect_to root_path, notice: "Mã đơn hàng không đúng"
    else
      @line_items = @order.line_items
    end
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
      redirect_to show_order_path(@order.order_no), notice: "Thông tin của bạn đã được lưu"
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

  def order_no_params
    params.require(:order).permit(:order_no)
  end
end
