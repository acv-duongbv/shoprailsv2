# frozen_string_literal: true
 
FactoryBot.define do
  factory :category do
    name { Faker::HarryPotter.location }
  end
end
 