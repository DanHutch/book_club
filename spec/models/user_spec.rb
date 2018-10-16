require 'rails_helper'
describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'Relationship' do
    it { should have_many(:reviews) }
  end
  describe 'sorting' do
    it 'can sort by review age' do
      user = User.create(name: "Dan Review")
      author_1 = Author.create(name: "First Author")
      book_1 = author_1.books.create(title: "First Book", pages: 100, year: 2000)
      review_1 = user.reviews.create(title: "Bad Book", book: book_1, score: 1, description: "I did not like this.")
      book_2 = author_1.books.create(title: "Second Book", pages: 200, year:2010)
      review_2 = user.reviews.create(title: "Better Than The Last One", book: book_2, score: 3, description: "I liked this book more.")

      expect(user.sort_reviews('DESC')).to eq([review_2, review_1])

      expect(user.sort_reviews('ASC')).to eq([review_1, review_2])
    end
  end
 end
