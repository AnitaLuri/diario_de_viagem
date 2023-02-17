require 'rails_helper'

describe 'Usuário acessa página de uma postagem especifica' do
  it 'com sucesso' do
    praia = Category.create!(name: 'Praia')
    cidade = Category.create!(name: 'Cidade')
    post_b = Post.create!(title: 'Nova York', country: 'USA', state: 'NY', city: 'Nova Iorque',
                          category: cidade, text: 'Nova Iorque ou Nova York é um dos 50 estados
                          dos Estados Unidos, localizado na Região nordeste do país.')
    image_b_path = Rails.root.join('spec/support/images/ny.jpg')
    post_b.image.attach(io: image_b_path.open, filename: 'ny.jpg')
    post_c = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                          restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post_c.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    visit root_path
    click_on 'Viagens'
    click_on 'Paraty'

    expect(page).to have_content 'RJ - Paraty'
    expect(page).to have_content 'Praia'
    expect(page).to have_content post_c.text
    expect(page).to have_content post_c.restaurant_tip
    expect(page).to have_content post_c.tour_tip
  end
end
