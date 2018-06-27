# frozen_string_literal: true
 
FactoryBot.define do
  factory :line_item do
    quantity { Faker::Number.number(1) }
  end
end
 