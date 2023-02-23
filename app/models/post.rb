class Post < ApplicationRecord
  belongs_to :category

  has_one_attached :image

  validates :title, :country, :state, :city, :text, presence: true
end
