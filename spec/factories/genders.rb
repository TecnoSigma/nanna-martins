FactoryBot.define do
  factory :gender do
    kind { ['Feminino', 'Masculino'].sample }
  end
end
