# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    name { Faker::Internet.user_name }
    address { Faker::Address.street_name }
    phone_number { Faker::Number.number(10) }
  end
end
