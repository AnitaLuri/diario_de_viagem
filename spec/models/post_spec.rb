require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#valid?' do
    it 'falso quando título fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: '', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando país fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: '', state: 'RJ', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando estado fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: 'BRA', state: '', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando cidade fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: 'BRA', state: 'RJ', city: '', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando categoria fica em branco' do
      post = Post.new(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: nil,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando conteudo fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                      text: '',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq false
    end
    it 'falso quando país é diferente de três caracteres' do
      praia = Category.create!(name: 'Praia')
      cidade = Category.create!(name: 'Cidade')
      post_a = Post.new(title: 'Paraty', country: 'BRA3', state: 'RJ', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                        restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')
      post_b = Post.new(title: 'Nova York', country: 'US', state: 'NY', city: 'Nova Iorque',
                        category: cidade, text: 'Nova Iorque ou Nova York é um dos 50 estados
                        dos Estados Unidos, localizado na Região nordeste do país.')

      expect(post_a.valid?).to eq false
      expect(post_b.valid?).to eq false
    end
    it 'falso quando estado é diferente de dois caracteres' do
      praia = Category.create!(name: 'Praia')
      cidade = Category.create!(name: 'Cidade')
      post_a = Post.new(title: 'Paraty', country: 'BRA', state: 'R', city: 'Paraty', category: praia,
                        text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                        restaurant_tip: 'Acarajé na praça central', tour_tip: 'Paraty-mirim')
      post_b = Post.new(title: 'Nova York', country: 'USA', state: 'NYo', city: 'Nova Iorque',
                        category: cidade, text: 'Nova Iorque ou Nova York é um dos 50 estados
                        dos Estados Unidos, localizado na Região nordeste do país.')

      expect(post_a.valid?).to eq false
      expect(post_b.valid?).to eq false
    end
    it 'verdadeiro quando dica de restaurante fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: '', tour_tip: 'Paraty-mirim')

      expect(post.valid?).to eq true
    end
    it 'verdadeiro quando dica de passeio fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.new(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                      text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio.',
                      restaurant_tip: 'Acarajé na praça central', tour_tip: '')

      expect(post.valid?).to eq true
    end
  end
end
