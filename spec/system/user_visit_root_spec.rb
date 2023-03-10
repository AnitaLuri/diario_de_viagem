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
  it 'e vê últimas postagens' do
    praia = Category.create!(name: 'Praia')
    cidade = Category.create!(name: 'Cidade')
    post_a = Post.create!(title: 'Big Sur - Rota 1', country: 'USA', state: 'CA', city: 'Big Sur',
                          category: praia, text: 'Big Sur é uma região localizada no centro da
                          Califórnia, nos Estados Unidos. ')
    image_a_path = Rails.root.join('spec/support/images/ca.jpg')
    post_a.image.attach(io: image_a_path.open, filename: 'ca.jpg')
    post_b = Post.create!(title: 'Nova York', country: 'USA', state: 'NY', city: 'Nova Iorque',
                          category: cidade, text: 'Nova Iorque ou Nova York é um dos 50 estados
                          dos Estados Unidos, localizado na Região nordeste do país.')
    image_b_path = Rails.root.join('spec/support/images/ny.jpg')
    post_b.image.attach(io: image_b_path.open, filename: 'ny.jpg')
    post_c = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio, com
                          a Serra da Bocaina ao fundo.')
    image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
    post_c.image.attach(io: image_c_path.open, filename: 'paraty.jpg')

    visit root_path

    expect(Post.all.length).to eq 3
    expect(page).to have_content 'Big Sur - Rota 1'
    expect(page).to have_css('img[src*="ca"]')
    expect(page).to have_content 'Nova York'
    expect(page).to have_css('img[src*="ny"]')
    expect(page).to have_content 'Paraty'
    expect(page).to have_css('img[src*="paraty"]')
  end
end
