require 'rails_helper'

describe 'Usuário se cadastra' do
  it 'com sucesso' do
    visit root_path
    click_on 'Login'
    click_on 'Cadastre-se'
    fill_in 'Nome', with: 'Maria'
    fill_in 'E-mail', with: 'maria@email.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Cadastrar'

    expect(page).to have_content 'Maria'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
  end

  it 'e não preenche todos os campos' do
    visit root_path
    click_on 'Login'
    click_on 'Cadastre-se'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível salvar usuário: 3 erros.'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Senha não pode ficar em branco'
    expect(page).to have_content 'Nome não pode ficar em branco'
  end
end
