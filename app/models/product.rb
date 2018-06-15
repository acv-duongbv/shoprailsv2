class Product < ApplicationRecord
  include Sluggable
  REGEX_IMAGE_URL = %r{\.(gif|jpg|png)\Z}i
  Error_image = "Chi nhan file GIF, JPG, PNG"
  validates :name, :description, :price, :image_url, presence: true
  validates :price, numericality: {gather_than: 0}
  belongs_to :category
  before_destroy :check_if_has_line_item

  private

  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      error.add(:base, "The cart has line item")
      return false
    end
  end
end
