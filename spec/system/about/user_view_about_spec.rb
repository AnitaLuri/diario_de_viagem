require 'rails_helper'

describe 'Usuário vê página sobre' do
  it 'com sucesso' do
    visit root_path
    click_on 'Sobre'

    expect(page).to have_content 'Sobre quem desenvolveu'
    expect(page).to have_css 'img[src*="eu"]'
    expect(page).to have_link 'github'
    expect(page).to have_link 'LinkedIn'
    expect(page).to have_link 'Instagram'
    expect(page).to have_content 'Outros projetos'
    expect(page).to have_link 'TreinaDev - Insurance'
    expect(page).to have_link 'Sistema de Frete'
    expect(page).to have_link 'Conversor'
    expect(page).to have_link 'Ranking'
    expect(page).to have_link 'Projeto-SQL'
  end
end