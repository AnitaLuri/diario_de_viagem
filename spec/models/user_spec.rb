require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'nome é obrigatório' do
        user = User.new(name: '')

        user.valid?

        expect(user.errors.include?(:name)).to be true
      end

      it 'e-mail é obrigatório' do
        user = User.new(email: '')

        user.valid?

        expect(user.errors.include?(:email)).to be true
      end

      it 'senha é obrigatória' do
        user = User.new(password: '')

        user.valid?

        expect(user.errors.include?(:password)).to be true
      end
    end
    context 'unique' do
      it 'e-mail é único' do
        User.create!(name: 'Pessoa', email: 'pessoa@email.com', password: 'password')
        user = User.new(email: 'pessoa@email.com')

        user.valid?

        expect(user.errors.include?(:email)).to be true
      end
    end
  end
  describe 'Ao criar um usuário' do
    it 'por padrão é regular' do
      user = User.create!(name: 'Pessoa', email: 'pessoa@email.com', password: 'password')

      expect(user.role).to eq 'regular'
    end
  end
end
