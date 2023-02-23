class Post < ApplicationRecord
  belongs_to :category

  has_one_attached :image

  validates :title, :country, :state, :city, :text, presence: true
  validates :country, length: { is: 3 }
  validates :state, length: { is: 2 }
end
