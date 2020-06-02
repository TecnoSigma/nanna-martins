gender = Gender.create({ kind: 'Feminino' })

stock = Stock.create({ minimum: 10, maximum: 100 })

collection = Collection.create({ name: "quam",
                                 station: "Inverno",
                                 year: 2020,
                                 status: Status::STATUSES[:activated] })

clothing_1 = Clothing.create({ reference: "abc1234",
                               kind: "Vestido",
                               name: "Vestido Afro NM",
                               feature: "Vestido de tecido",
                               new: true,
                               history: "Vestido de tecido afro",
                               description: ["Algodão", "Seda"],
                               status: "Ativo",
                               size: "M",
                               complement: ["esse", "quia"],
                               amount: 15,
                               collection: collection,
                               gender: gender,
                               stock: stock })

clothing_1.photos.attach(io: File.open('spec/fixtures/files/vestido_1.png'), filename: 'vestido_1.png', content_type: 'image/png')
clothing_1.photos.attach(io: File.open('spec/fixtures/files/vestido_2.png'), filename: 'vestido_2.png', content_type: 'image/png')
clothing_1.photos.attach(io: File.open('spec/fixtures/files/vestido_3.png'), filename: 'vestido_3.png', content_type: 'image/png')
clothing_1.photos.attach(io: File.open('spec/fixtures/files/vestido_4.png'), filename: 'vestido_4.png', content_type: 'image/png')

clothing_2 = Clothing.create({ reference: "abc5678",
                               kind: "Vestido",
                               name: "Vestido Angola",
                               feature: "Vestido de tecido",
                               new: true,
                               history: "Vestido de tecido afro",
                               description: ["Algodão", "Estampa"],
                               status: "Ativo",
                               size: "M",
                               complement: ["esse", "quia"],
                               amount: 8,
                               collection: collection,
                               gender: gender,
                               stock: stock })

clothing_2.photos.attach(io: File.open('spec/fixtures/files/vestido_5.png'), filename: 'vestido_5.png', content_type: 'image/png')
clothing_2.photos.attach(io: File.open('spec/fixtures/files/vestido_6.png'), filename: 'vestido_6.png', content_type: 'image/png')
clothing_2.photos.attach(io: File.open('spec/fixtures/files/vestido_7.png'), filename: 'vestido_7.png', content_type: 'image/png')
clothing_2.photos.attach(io: File.open('spec/fixtures/files/vestido_8.png'), filename: 'vestido_8.png', content_type: 'image/png')
