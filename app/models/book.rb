class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors

  def self.create_new(hash)
    hash[:title] = hash[:title].titlecase
    array = parce_string(hash)
    hash[:authors] = array.map do |author|
      Book.select_author(author)
    end
    Book.create(hash)
  end

   def self.select_author(author)
    data = Author.find_by(name: "#{author}".titlecase) if author.class == String
      if author.class == Author
        author
      elsif data.nil?
        Author.create(name: "#{author}".titlecase)
      else
        data
      end
   end

   def self.parce_string(hash)
     hash[:authors].titlecase.split(', ')
   end
end
