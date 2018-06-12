class Category < ApplicationRecord
  include Sluggable
  has_many :products
end
