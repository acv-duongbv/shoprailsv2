class Order < ApplicationRecord
  validates :name, :phone_number, :address, presence: true
  validates :phone_number, numericality: true
end
