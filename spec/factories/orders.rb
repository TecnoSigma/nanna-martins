FactoryBot.define do
  factory :order do
    delivery_forecast { 10.days.after }
    freight { Faker::Number.decimal(l_digits: 2) }
    final_payment { Faker::Number.decimal(l_digits: 2) }
    down_payment { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.number }
    observation { Faker::Lorem.sentence }
    status { :pendent }
  end
end
