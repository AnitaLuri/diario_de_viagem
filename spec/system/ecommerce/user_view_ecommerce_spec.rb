require 'rails_helper'

describe 'Usuário visita página da loja' do
  it 'e vê produtos' do
    json_data = Rails.root.join('spec/support/json/products.json').read
    fake_response = double('faraday::response', status: 200, body: json_data)
    allow(Faraday).to receive(:get).with('https://fakestoreapi.com/products').and_return(fake_response)

    visit root_path
    click_on 'Loja'

    expect(page).to have_content 'Alguns de itens úteis para sua próxima viagem!'
    expect(page).to have_content 'Toalha de Microfibra M'
    expect(page).to have_content 'R$ 70,00'
    expect(page).to have_content 'Garrafa de trilha 600ml'
    expect(page).to have_content 'R$ 50,00'
    expect(page).to have_content 'Mochila cinza'
    expect(page).to have_content 'R$ 180,00'
  end
end
