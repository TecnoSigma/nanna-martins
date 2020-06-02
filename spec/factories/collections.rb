FactoryBot.define do
  factory :collection do
    name { Faker::Lorem.word }
    station { ['Primavera', 'Verão', 'Outuno', 'Inverno'].sample }
    year { DateTime.now.year }
    status { Status::STATUSES[:activated] }
  end
end
