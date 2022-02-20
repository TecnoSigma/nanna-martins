FactoryBot.define do
  factory :craft do
    reference { 'any_reference' }
    segment { %w(Acessórios' Decoração Vestuário).sample }
    kind { Faker::Lorem.word }
    quantity { 1 }
    season { %w(Primavera Verão Outono Inverno).sample }
    year { DateTime.now.year.next }
    exclusivity { [true, false].sample }
  end
end
