FactoryBot.define do
  factory :feedstock do
    name { Faker::Lorem.word }
    measurement_unit { %w(cm gramas).sample }
    quantity { Faker::Number.number(digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
