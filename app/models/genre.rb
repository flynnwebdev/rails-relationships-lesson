class Genre < ApplicationRecord
    has_many :books_genres
    has_many :books, through: :books_genres
end
