require 'rails_helper'

describe 'Usuário atualiza postagem' do
  it 'e não é administrador' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    patch(post_path(post.id), params: { post: { title: 'Paraty-mirim', country: 'BRA', state: 'RJ', city: 'Paraty',
                                                category: praia, text: 'Paraty fica na costa sudeste do Brasil',
                                                restaurant_tip: 'Acarajé praça central', tour_tip: 'Paraty-mirim' } })

    expect(response).to redirect_to(root_path)
  end
end
