require 'rails_helper'

describe 'Usuário visita página da loja' do
  it 'e vê produtos' do
    json_data = Rails.root.join('spec/support/json/products.json').read
    fake_response = double('faraday::response', status: 200, body: json_data)
    allow(Faraday).to receive(:get).with('https://fakestoreapi.com/products').and_return(fake_response)

    visit root_path
    click_on 'Loja'

    expect(page).to have_content 'Alguns de itens úteis para sua próxima viagem!'
    expect(page).to have_content 'Toalha'
    expect(page).to have_content 'R$ 70,00'
    expect(page).to have_content 'Garrafa'
    expect(page).to have_content 'R$ 50,00'
    expect(page).to have_content 'Mochila'
    expect(page).to have_content 'R$ 180,00'
  end
  it 'e não existem produtos' do
    fake_response = double('faraday::response', status: 200, body: '{}')
    allow(Faraday).to receive(:get).with('https://fakestoreapi.com/products').and_return(fake_response)

    visit root_path
    click_on 'Loja'

    expect(page).to have_content 'Nenhum produto disponível no momento'
  end
end
