unless Rails.env.production?
  User.create(email: 'tecnooxossi@gmail.com', password: 'oxossi12')
  User.create(email: 'ateliernammartins@gmail.com', password: 'inhasa21')

  FactoryBot.create_list(:customer, 30)

  FactoryBot.create_list(:provider, 2)

  for _ in 1..100 do
    provider_id = (Provider.first.id..Provider.count).to_a.sample
    FactoryBot.create(:stock, providers: [[Provider.first], [Provider.last], [Provider.first, Provider.last]].sample)
  end
end
