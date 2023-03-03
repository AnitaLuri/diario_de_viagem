class User < ApplicationRecord
  enum :role, { regular: 10, admin: 20 }, default: :regular
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: nil
  validates :name, presence: true
end
