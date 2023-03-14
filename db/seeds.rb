admin = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)

praia = Category.create!(name: 'Praia')
cidade = Category.create!(name: 'Cidade')
montanha = Category.create!(name: 'Montanhas')

post_a = Post.create!(title: 'Big Sur - Rota 1', country: 'USA', state: 'CA', city: 'Big Sur',
                      category: praia, text: 'Big Sur é uma região localizada no centro da
                      Califórnia, nos Estados Unidos. ')
image_a_path = Rails.root.join('spec/support/images/ca.jpg')
post_a.image.attach(io: image_a_path.open, filename: 'ca.jpg')
post_b = Post.create!(title: 'Nova York', country: 'USA', state: 'NY', city: 'Nova Iorque',
                      category: cidade, text: 'Nova Iorque ou Nova York é um dos 50 estados
                      dos Estados Unidos, localizado na Região nordeste do país.')
image_b_path = Rails.root.join('spec/support/images/ny.jpg')
post_b.image.attach(io: image_b_path.open, filename: 'ny.jpg')
post_c = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                      a Serra da Bocaina ao fundo.')
image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
post_c.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
post_d = Post.create!(title: 'São Paulo', country: 'BRA', state: 'SP', city: 'São Paulo',
                      category: cidade, text: 'São Paulo é uma região localizada no centro da')
image_d_path = Rails.root.join('spec/support/images/sp.jpg')
post_d.image.attach(io: image_d_path.open, filename: 'sp.jpg')
post_e = Post.create!(title: 'São Thome', country: 'BRA', state: 'MG', city: 'São Thome das Letras',
                      category: montanha, text: 'São Thome das Letras é uma cidade mística cheia de 
                      energias positivas e cachoeiras')
image_e_path = Rails.root.join('spec/support/images/stl.jpg')
post_e.image.attach(io: image_e_path.open, filename: 'stl.jpg')