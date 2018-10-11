class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors

  def self.create_new(hash)
    hash[:title] = hash[:title].titlecase
    array = hash[:authors]
    hash[:authors] = array.map do |author|
      if author.class == String
        Author.create(name: "#{author}".titlecase)
      else
        author
      end
    end
    Book.create(hash)
  end
end
