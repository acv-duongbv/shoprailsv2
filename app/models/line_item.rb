class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true
  validates :quantity, numericality: {gather_than: 0}

  def total_price
    product.price * quantity
  end
end
