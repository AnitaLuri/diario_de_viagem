require 'rails_helper'

describe 'Usuário visita root_path' do
  it 'e vê conteúdo' do 
    visit root_path

    within 'nav' do
      expect(page).to have_content 'Diário de Viagem'
      expect(page).to have_link 'Viagens'
      expect(page).to have_link 'Loja'
      expect(page).to have_link 'Sobre'
    end 
    expect(page).to have_css('img[src*="capa"]')
    expect(page).to have_content 'Últimas postagens'
  end
end