FactoryBot.define do
  factory :accessory do
    reference { 'abc1234' }
    kind { ['pulseira', 'cinto'].sample }
    name { 'Cinto Nanna Martins' }
    feature { 'Cinto de tecido' }
    new { true }
    history { 'Cinto de tecido afro' }
    description { [Faker::Lorem.word, Faker::Lorem.word] }
    status { Status::STATUSES[:activated] }
    size { ['P', 'M', 'G'].sample }
    complement { [Faker::Lorem.word, Faker::Lorem.word] }
    amount { Faker::Number.number(digits: 3) }
  end
end
