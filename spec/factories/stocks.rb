FactoryBot.define do
  factory :stock do
    minimum { 10 }
    maximum { 100 }
  end
end
