FactoryBot.define do
  factory :cost do
    quantity { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence}
    periodicity { %w(Diária Mensal).sample }
    price { Faker::Number.decimal(l_digits: 2) }
  end

  trait :fixed do
    type { 'Fixed' }
  end

  trait :material do
    type { 'Material' }
  end

  trait :variable do
    type { 'Variable' }
  end
end
