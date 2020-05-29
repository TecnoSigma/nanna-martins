FactoryBot.define do
  factory :clothing do
    reference { 'abc1234' }
    kind { ['pulseira', 'cinto'].sample }
    name { 'Saia Nanna Martins' }
    feature { 'Saia de tecido' }
    new { true }
    history { 'Saia de tecido afro' }
    description { [Faker::Lorem.word, Faker::Lorem.word] }
    status { Status::STATUSES[:activated] }
    size { ['P', 'M', 'G'].sample }
    complement { [Faker::Lorem.word, Faker::Lorem.word] }
    amount { Faker::Number.number(digits: 3) }
  end
end
