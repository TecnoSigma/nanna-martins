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

clothing_3 = Clothing.create({ reference: "xvz9999",
                               kind: "Vestido",
                               name: "Vestido Laos",
                               feature: "Vestido de tecido",
                               new: true,
                               history: "Vestido de tecido afro",
                               description: ["Algodão", "Estampa"],
                               status: "Ativo",
                               size: "P",
                               complement: ["banana", "caqui"],
                               amount: 12,
                               collection: collection,
                               gender: gender,
                               stock: stock })

clothing_3.photos.attach(io: File.open('spec/fixtures/files/vestido_9.png'), filename: 'vestido_9.png', content_type: 'image/png')
clothing_3.photos.attach(io: File.open('spec/fixtures/files/vestido_10.png'), filename: 'vestido_10.png', content_type: 'image/png')
clothing_3.photos.attach(io: File.open('spec/fixtures/files/vestido_11.png'), filename: 'vestido_11.png', content_type: 'image/png')
clothing_3.photos.attach(io: File.open('spec/fixtures/files/vestido_12.png'), filename: 'vestido_12.png', content_type: 'image/png')

accessory_1 = Accessory.create({ reference: "ench1234",
                                 kind: "Encharpe",
                                 name: "Encharpe Monocron",
                                 feature: "Encharpe monocromático",
                                 new: true,
                                 history: "Encharpe de tecido",
                                 description: ["Tecido", "lã"],
                                 status: "Ativo",
                                 size: "P",
                                 complement: ["off-white", "lã"],
                                 amount: 10,
                                 collection: collection,
                                 gender: gender,
                                 stock: stock })

accessory_1.photos.attach(io: File.open('spec/fixtures/files/acessorio_1.png'), filename: 'acessorio_1.png', content_type: 'image/png')
accessory_1.photos.attach(io: File.open('spec/fixtures/files/acessorio_2.png'), filename: 'acessorio_2.png', content_type: 'image/png')
accessory_1.photos.attach(io: File.open('spec/fixtures/files/acessorio_3.png'), filename: 'acessorio_3.png', content_type: 'image/png')

accessory_2 = Accessory.create({ reference: "abc8888",
                                 kind: "Brinco",
                                 name: "Brinco de Pérolas",
                                 feature: "Brinco de Pérolas",
                                 new: true,
                                 history: "Brinco de Pérolas de Água Salgada",
                                 description: ["Brinco", "Pérolas"],
                                 status: "Ativo",
                                 size: "P",
                                 complement: ["off-white", "ouro"],
                                 amount: 20,
                                 collection: collection,
                                 gender: gender,
                                 stock: stock })

accessory_2.photos.attach(io: File.open('spec/fixtures/files/acessorio_4.png'), filename: 'acessorio_4.png', content_type: 'image/png')
accessory_2.photos.attach(io: File.open('spec/fixtures/files/acessorio_5.png'), filename: 'acessorio_5.png', content_type: 'image/png')
accessory_2.photos.attach(io: File.open('spec/fixtures/files/acessorio_6.png'), filename: 'acessorio_6.png', content_type: 'image/png')
