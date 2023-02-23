require 'rails_helper'

describe 'Usuário faz nova postagem' do
  it 'com sucesso' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    Category.create!(name: 'Cidade')
    Category.create!(name: 'Praia')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Adicionar Postagem'
    fill_in 'Título', with: 'Sorocotuba'
    fill_in 'País', with: 'BRA'
    fill_in 'Estado', with: 'SP'
    fill_in 'Cidade', with: 'Guaruja'
    select 'Praia', from: 'Categoria'
    fill_in 'Conteúdo', with: 'A Praia do Sorocotuba está localizada entre as praias da Enseada e Pernambuco'
    attach_file 'Imagem', Rails.root.join('spec/support/images/sorocotuba.jpeg')
    click_on 'Criar Postagem'

    expect(page).to have_content 'Postagem adicionada com sucesso!'
    expect(current_path).to eq(post_path(Post.last.id))
    expect(page).to have_content 'Sorocotuba'
    expect(page).to have_content 'SP - Guaruja'
    expect(page).to have_content 'Praia'
    expect(page).to have_content 'A Praia do Sorocotuba está localizada entre as praias da Enseada e Pernambuco'
    expect(page).to have_css('img[src*="sorocotuba.jpeg"]')
  end
  it 'faltando informações' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    Category.create!(name: 'Cidade')
    Category.create!(name: 'Praia')

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Adicionar Postagem'
    fill_in 'Título', with: ''
    fill_in 'País', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Conteúdo', with: ''
    click_on 'Criar Postagem'

    expect(page).to have_content 'Postagem não foi criada'
    expect(page).to have_content 'Título não pode ficar em branco'
    expect(page).to have_content 'País não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Conteúdo não pode ficar em branco'
  end
  it 'e não é o administrador' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :regular)
    Category.create!(name: 'Cidade')
    Category.create!(name: 'Praia')

    login_as(user)
    visit root_path
    click_on 'Viagens'

    expect(page).not_to have_link 'Adicionar Postagem'
  end
end
