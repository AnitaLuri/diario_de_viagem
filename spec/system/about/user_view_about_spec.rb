require 'rails_helper'

describe 'Usuário vê página sobre' do
  it 'com sucesso' do
    visit root_path
    click_on 'Sobre'

    expect(page).to have_content 'Sobre quem desenvolveu'
    expect(page).to have_css 'img[src*="eu"]'
    expect(page).to have_content 'Outros Projetos'
    expect(page).to have_link 'TreinaDev'
    expect(page).to have_css 'img[src*="insurance"]'
    expect(page).to have_link 'Sistema de Frete'
    expect(page).to have_css 'img[src*="frete"]'
    expect(page).to have_link 'Conversor'
    expect(page).to have_css 'img[src*="convert"]'
    expect(page).to have_link 'Ranking'
    expect(page).to have_css 'img[src*="ranking"]'
  end
end
