require 'rails_helper'

describe 'Usuário exclui um comentário' do
  it 'com sucesso' do 
    user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
    comment =  Comment.create!(user: user, post: post, comment_text: 'A praia estava limpa e vazia')

    login_as(user)
    visit root_path
    click_on 'Paraty'
    click_on 'Excluir'

    expect(page).to have_content 'Comentário excluido com sucesso!'
  end
  it 'e deve ser o autor' do 
    maria = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
    joao = User.create!(email: 'joao@email.com', password: 'password', name: 'João', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
    comment =  Comment.create!(user: joao, post: post, comment_text: 'A praia estava limpa e vazia')

    login_as(maria)
    visit root_path
    click_on 'Paraty'

    expect(page).not_to have_button 'Excluir'
  end
  it 'e é administrador' do 
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)
    maria = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
    praia = Category.create!(name: 'Praia')
    post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
    comment =  Comment.create!(user: maria, post: post, comment_text: 'A praia estava limpa e vazia')

    login_as(user)
    visit root_path
    click_on 'Paraty'
    click_on 'Excluir'

    expect(page).to have_content 'Comentário excluido com sucesso!'
  end
end