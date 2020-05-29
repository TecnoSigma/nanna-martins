FactoryBot.define do
  factory :customer do
    forename { Faker::Name.name }
    surname { Faker::Lorem.word }
    email { Faker::Internet.email }
    gender { Faker::Lorem.word }
    document { Faker::Lorem.word }
    address { Faker::Lorem.word }
    number { Faker::Lorem.word }
    district { Faker::Lorem.word }
    city { Faker::Lorem.word }
    state { Faker::Lorem.word }
    postal_code { Faker::Lorem.word }
    status { Faker::Lorem.word }
    password { Faker::Internet.password }
  end
end
