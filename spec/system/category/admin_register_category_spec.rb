require 'rails_helper'

describe 'Usuário admin cadastra nova categoria' do
  it 'a partir do formulario de criação da postagem' do
    user = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)

    login_as(user)
    visit root_path
    click_on 'Viagens'
    click_on 'Adicionar Postagem'
    click_on 'Criar nova Categoria'

    expect(current_path).to eq new_category_path
    expect(page).to have_field 'Nome da Categoria'
    expect(page).to have_button 'Criar Categoria'
  end
end