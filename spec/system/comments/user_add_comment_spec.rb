require 'rails_helper'

describe 'Usuário adiciona uma comentário a uma postagem'do
  it 'e deve estar autenticado' do
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    visit root_path
    click_on 'Paraty'

    expect(page).not_to have_button 'Incluir comentário'
    expect(page).to have_content 'Faça login para compartilhar sua experiência!'
  end
  it 'com sucesso' do
    user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Paraty'
    within '#comment-form' do
      fill_in 'Comentário', with: 'Bom destino para a familia!'
      click_on 'Incluir comentário'
    end

    expect(current_path).to eq post_path(post.id)
    expect(page).to have_content 'Outros comentários!'
    expect(page).to have_content 'Maria'
    expect(page).to have_content 'Bom destino para a familia!'
  end
end
