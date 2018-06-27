FactoryBot.define do
  factory :product do
    name { Faker::Appliance.equipment }
    description { Faker::Demographic.educational_attainment }
    price { Faker::Commerce.price }
    image_url { Faker::Internet.url }
  end
end
