class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors


  # def self.create_book(hash)
  #   hash[:title] = hash[:title].titlecase
  #   # array = parce_string(hash)
  #   # hash[:authors] = array.map do |author|
  #   #   Book.select_author(author)
  #   # end
  #   Book.create(hash)
  # end

  # def self.parce_string(hash)
  #  hash[:authors].titlecase.split(', ')
  # end
end
