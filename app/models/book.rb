class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors

  def self.create_new(hash)
    hash[:title] = hash[:title].titlecase
    array = hash[:authors]
    hash[:authors] = array.map do |author|
      Book.select_author(author)
    end
    Book.create(hash)
  end

   def self.select_author(author)
    database_author = Author.where(name: "#{author}".titlecase)
      if database_author.empty?
        Author.create(name: "#{author}".titlecase)
      elsif author.class == Author
        author
      else
        database_author
      end
   end
end
