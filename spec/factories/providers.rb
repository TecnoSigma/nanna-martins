FactoryBot.define do
  factory :provider do
    name { Faker::Name.name }
    kind { %w(PF PJ).sample }
    contact { Faker::Name.name }
    document { Faker::Base.regexify('\d{3}.\d{3}.\d{3}-\d{2}') }
    address { Faker::Address.street_name }
    number { Faker::Number.number(digits: 2) }
    complement { %w[frente fundos].sample }
    district { 'Centro' }
    city { Faker::Address.city }
    state { Faker::Address.state }
    postal_code { Faker::Base.regexify('\d{5}-\d{3}') }
    telephone do
      "(#{Faker::Base.regexify('([1-9]{2})')}) " \
        "#{Faker::Base.regexify('[0-9]{4}')} "   \
        "#{Faker::Base.regexify('[0-9]{4}')}"
    end
    site { Faker::Internet.url }
    email { Faker::Internet.email }
    status { :activated }
  end
end
