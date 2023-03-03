require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#valid?' do
    it 'falso quando usuário fica em branco' do
      praia = Category.create!(name: 'Praia')
      post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
      image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
      post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
      comment = Comment.new(user: nil, post:, comment_text: 'A praia estava limpa e vazia')

      expect(comment.valid?).to eq false
    end
    it 'falso quando a postagem fica em branco' do
      user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
      comment = Comment.new(user:, post: nil, comment_text: 'A praia estava limpa e vazia')

      expect(comment.valid?).to eq false
    end
    it 'falso quando o texto fica em branco' do
      user = User.create!(email: 'maria@email.com', password: 'password', name: 'Maria', role: :regular)
      praia = Category.create!(name: 'Praia')
      post = Post.create!(title: 'Paraty', country: 'BRA', state: 'RJ', city: 'Paraty', category: praia,
                          text: 'Paraty fica na costa sudeste do Brasil, 200 quilômetros ao sul do Rio')
      image_c_path = Rails.root.join('spec/support/images/paraty.jpg')
      post.image.attach(io: image_c_path.open, filename: 'paraty.jpg')
      comment = Comment.new(user:, post:, comment_text: '')

      expect(comment.valid?).to eq false
    end
  end
end
