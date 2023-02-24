require 'rails_helper'

describe 'Usuário edita um produto' do
  it 'e vê as informações do produto' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'
    click_on 'Editar'

    expect(page).to have_css('img[src*="paraty"]')
    expect(page).to have_content 'Imagem cadastrada:'
    expect(page).to have_field('Título', with: 'Paraty')
    expect(page).to have_field('País', with: 'BRA')
    expect(page).to have_field('Estado', with: 'RJ')
    expect(page).to have_field('Cidade', with: 'Paraty')
    expect(page).to have_select('Categoria', selected: 'Praia')
    expect(page).to have_field('Conteúdo', with: post.text)
    expect(page).to have_field('Cidade', with: 'Paraty')
  end

  it 'com sucesso' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'
    click_on 'Editar'
    fill_in 'Título', with: 'Paraty-mirim'
    fill_in 'Cidade', with: 'Rio de Janeiro'
    fill_in 'Conteúdo', with: 'Paraty é lindo'
    fill_in 'Dica de Restaurante', with: 'Acarajé do centro histórico'
    click_on 'Atualizar Postagem'

    expect(current_path).to eq post_path(post.id)
    expect(page).to have_content 'Postagem atualizada com sucesso!'
    expect(page).to have_content 'Paraty-mirim'
    expect(page).to have_content 'RJ - Rio de Janeiro'
    expect(page).to have_content 'Paraty é lindo'
    expect(page).to have_css('img[src*="paraty.jpg"]')
    expect(page).to have_content 'Dica de Restaurante: Acarajé do centro histórico'
    expect(page).to have_content 'Dica de Passeio:'
  end

  it 'com informações faltando' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'
    click_on 'Editar'
    fill_in 'Título', with: ''
    fill_in 'País', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Conteúdo', with: ''
    click_on 'Atualizar Postagem'

    expect(page).to have_content 'Postagem não foi atualizada'
    expect(page).to have_content 'Título não pode ficar em branco'
    expect(page).to have_content 'País não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Conteúdo não pode ficar em branco'
  end

  it 'e não é administrador' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'

    expect(page).not_to have_link 'Editar'
  end

  it 'e volta para tela anterior' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'
    click_on 'Editar'
    click_on 'Voltar'

    expect(current_path).to eq post_path(post.id)
  end
end
