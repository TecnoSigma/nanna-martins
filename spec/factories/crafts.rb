FactoryBot.define do
  factory :craft do
    type { %w(accessory clothing decoration).sample }
    reference { 'any_reference' }
    description { Faker::Lorem.word }
    quantity { 1 }
    season { %w(Primavera Verão Outono Inverno).sample }
    year { DateTime.now.year.next }
    exclusivity { [true, false].sample }
    worked_hours { Faker::Number.decimal(l_digits: 2) }
    weight { Faker::Number.decimal(l_digits: 2) }
  end
end
