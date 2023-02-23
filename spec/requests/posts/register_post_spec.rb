require 'rails_helper'

describe 'Usuário adiciona uma postagem' do
  it 'e não é administrador' do
    user = User.create!(email: 'user@email.com', password: 'password', name: 'Maria', role: :regular)
    praia = Category.create!(name: 'Praia')

    login_as(user)
    post(posts_path, params: { post: { title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                                       text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                                       restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim' } })

    expect(response).to redirect_to(root_path)
    expect(Post.all.length).to eq(0)
  end
  it 'a partir da rota new' do
    user = User.create!(email: 'user@email.com', password: 'password', name: 'Maria', role: :regular)
    Category.create!(name: 'Praia')

    login_as(user)
    get(new_post_path)

    expect(response).to redirect_to(root_path)
  end
end
