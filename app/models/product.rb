class Product < ApplicationRecord
  REGEX_IMAGE_URL = %r{\.(gif|jpg|png)\Z}i
  Error_image = "Chi nhan file GIF, JPG, PNG"
  validates :name, :description, :price, :image_url, presence: true
  validates :price, numericality: {gather_than: 0}
  validates :name, uniqueness: true
  validates :image_url, format: {with: REGEX_IMAGE_URL, message: Error_image}
end
