class Order < ApplicationRecord
  validates :name, :phone_number, :address, presence: true
  validates :phone_number, numericality: true
  has_many :line_items, dependent: :destroy
  before_save :default_values

  def default_values
    begin
      key = SecureRandom.hex(7).upcase
    end until !Order.exists?(order_no: key)
    self.order_no ||= key # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

  def add_line_item_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
