class Post < ApplicationRecord
  belongs_to :category

  has_one_attached :image
  has_many :comments, dependent: nil

  validates :title, :country, :state, :city, :text, presence: true
  validates :title, uniqueness: true
  validates :country, length: { is: 3 }
  validates :state, length: { is: 2 }
end
