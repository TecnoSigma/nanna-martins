FactoryBot.define do
  factory :offer_channel do
    newsletter { true }
    whatsapp { true }
    sms { true }
  end
end
