FactoryBot.define do
  factory :category do
    name { Faker::HarryPotter.location }
  end
end
