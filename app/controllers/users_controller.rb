class UsersController < ApplicationController
  before_action :authenticate_user!

  def history
    @orders = current_user.orders.where(status: "paid").order("purchased_at ASC")
  end
end
