class User < ApplicationRecord
  validates_presence_of :name

  has_many :reviews

  def self.top_3
    User.do_sort('DESC').first(3)
  end

  def self.do_sort(dir)
    User.select('users.*, count(reviews) as review_count').joins(:reviews).group(:user_id, :id).order("review_count #{dir}")
  end

  def sort_reviews(dir)
    reviews.order("created_at #{dir}")
  end

end
