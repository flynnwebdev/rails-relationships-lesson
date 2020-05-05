class Book < ApplicationRecord
  belongs_to :author
  has_many :books_genres
  has_many :book_lists
  has_many :users, through: :book_lists
  has_many :genres, through: :books_genres

  has_one_attached :picture

  validates :title, presence: true, length: { minimum: 2 }
end
