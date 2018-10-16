class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :book_authors
  has_many :reviews
  has_many :authors, through: :book_authors
  has_many :user, through: :reviews

  def review_count
    reviews.size
  end

  def other_authors(id)
    authors.where.not(id: id)
  end

  def avg_rating
    reviews.average(:score).to_f.round(1)
  end

  def top_review
    sort_reviews('DESC').first
  end

  def top_3_reviews
    sort_reviews('DESC').first(3)
  end

  def bottom_3_reviews
    sort_reviews('ASC').first(3)
  end

  def sort_reviews(dir)
    reviews.order("score #{dir}")
  end

  def self.show_3_by_rating(dir)
    Book.do_sort('avg_rating', dir).first(3)
  end

  def self.do_sort(trait, dir)
    Book.select('books.*, avg(score) as avg_rating, count(reviews) as review_count').joins(:reviews).group(:book_id, :id).order("#{trait} #{dir}")
  end

end
