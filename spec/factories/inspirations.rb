FactoryBot.define do
  factory :inspiration do
    status { 1 }
  end

  factory :pin, class: Pin, parent: :inspiration do
    url { Faker::Internet.url }
    segment { Faker::Lorem.word }
  end
end
