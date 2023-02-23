require 'rails_helper'

describe 'Usuário faz login' do
  context 'como administrador' do
    it 'com sucesso' do
      User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)

      visit root_path
      within 'nav' do
        click_on 'Login'
      end
      within 'form' do
        fill_in 'E-mail', with: 'admin@email.com'
        fill_in 'Senha', with: 'password'
        click_on 'Entrar'
      end

      within 'nav' do
        expect(page).not_to have_link 'Login'
        expect(page).to have_content 'Anita'
        expect(page).to have_button 'Sair'
      end
      expect(page).to have_content 'Login efetuado com sucesso.'
    end
    it 'e faz logout' do
      admin = User.create!(email: 'admin@email.com', password: 'password', name: 'Anita', role: :admin)

      login_as admin
      visit root_path
      click_on 'Anita'
      click_on 'Sair'

      expect(page).to have_link 'Login'
      expect(page).not_to have_link 'Sair'
      expect(page).not_to have_content 'Anita'
      expect(page).to have_content 'Logout efetuado com sucesso.'
    end
  end
  context 'como usuário regular' do
    it 'com sucesso' do
      User.create!(name: 'Maria', email: 'maria@email.com', password: 'password', role: :regular)

      visit root_path
      within 'nav' do
        click_on 'Login'
      end
      within 'form' do
        fill_in 'E-mail', with: 'maria@email.com'
        fill_in 'Senha', with: 'password'
        click_on 'Entrar'
      end

      within 'nav' do
        expect(page).not_to have_link 'Login'
        expect(page).to have_button 'Sair'
        expect(page).to have_content 'Maria'
      end
      expect(page).to have_content 'Login efetuado com sucesso.'
    end
  end
end
