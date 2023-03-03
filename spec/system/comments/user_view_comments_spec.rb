require 'rails_helper'

describe 'Usuário vê outrso comentários' do
  it 'mesmo não autenticado' do
    user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
    Comment.create!(user:, post:, comment_text: 'A praia estava limpa e vazia')

    visit root_path
    click_on 'Paraty'

    expect(page).not_to have_button 'Incluir comentário'
    expect(page).to have_content 'Faça login para compartilhar sua experiência!'
    expect(page).to have_content 'Maria'
    expect(page).to have_content 'A praia estava limpa e vazia'
  end
end
