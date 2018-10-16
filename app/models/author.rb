class Author < ApplicationRecord
  validates_presence_of :name

  has_many :book_authors
  has_many :books, through: :book_authors, dependent: :destroy

  def self.authors_by_book(hash)
    array = hash[:authors].split(', ')
    new_array = array.map do |author|
      author.strip!
      self.find_or_create_by(name: author.titlecase)
    end
    hash[:authors] = new_array
  end
end
