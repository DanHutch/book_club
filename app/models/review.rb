class Review < ApplicationRecord
  validates_presence_of :title, :description, :score

  validates :score, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :book
  belongs_to :user
end
