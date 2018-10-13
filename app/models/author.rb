class Author < ApplicationRecord
  validates_presence_of :name

  has_many :book_authors
  has_many :books, through: :book_authors

  def self.authors_by_book(hash)
    array = hash[:authors].split(', ')
    new_array = array.map do |author|
      author.strip!
      self.find_or_create_by(name: author.titlecase)
    end
    hash[:authors] = new_array
  end
  #
  # def self.select_author(author)
  #   data = Author.find_by(name: "#{author}".titlecase) if author.class == String
  #   if author.class == Author
  #     author
  #   elsif data.nil?
  #     Author.create(name: "#{author}".titlecase)
  #   else
  #     data
  #   end
  # end
end
