class Category < ApplicationRecord
  include Sluggable
  has_many :products
  before_destroy :check_if_has_product

  private

  def check_if_has_product
    if products.empty?
      return true
    else
      error.add(:base, " This category has a product")
      return false
    end
  end
end
