FactoryBot.define do
  factory :collection do
    name { Faker::Lorem.word }
    station { ['Primavera', 'Verão', 'Outuno', 'Inverno'].sample }
    status { DateTime.now.year }
  end
end
