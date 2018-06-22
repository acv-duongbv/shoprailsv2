class Product < ApplicationRecord
  include Sluggable
  validates :name, :description, :price, :image_url, presence: true
  validates :price, numericality: {gather_than: 0}
  belongs_to :category
  has_many :line_items, dependent: :destroy
  before_destroy :check_if_has_line_item

  private

  def check_if_has_line_item?
    if line_items.empty?
      return true
    else
      error.add(:base, "The cart has line item")
      return false
    end
  end
end
