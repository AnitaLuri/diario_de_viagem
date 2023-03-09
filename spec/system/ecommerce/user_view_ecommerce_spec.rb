require 'rails_helper'

describe 'Usuário visita página da loja' do
  it 'e vê produtos' do
    json_data = File.read(Rails.root.join('spec/support/json/products.json'))
    fake_response = double("faraday::response", status: 200, body: json_data)
    allow(Faraday).to receive(:get).with('http://localhost:4000/api/v1/products').and_return(fake_response)

    visit root_path
    click_on 'Loja'

    expect(page).to have_content 'Lojinha de itens úteis para sua próxima viagem!'
    expect(page).to have_content 'Toalha de Microfibra M'
    expect(page).to have_content 'R$ 70,00'
    expect(page).to have_content 'Garrafa de trilha 600ml'
    expect(page).to have_content 'R$ 50,00'
    expect(page).to have_content 'Mochila cinza'
    expect(page).to have_content 'R$ 180,00'
  end
end