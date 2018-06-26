FactoryBot.define do
  factory :order do
    name { Faker::FunnyName.two_word_name }
    address { Faker::Address.street_name }
    phone_number { Faker::Number.number(10) }
  end
end
