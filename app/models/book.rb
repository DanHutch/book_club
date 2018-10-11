class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors

  def review_count
    reviews.size
  end

  def avg_rating
    reviews.average(:score).to_f.round(1)
  end

  def self.sort(trait, dir)
    Book.select('books.*, avg(score) as avg_rating').joins(:reviews).group(:book_id, :id).order("#{trait} #{dir}")
  end

end
