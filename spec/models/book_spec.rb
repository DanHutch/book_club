require 'rails_helper'
describe Book, type: :model do
  describe 'Validations' do
    # via shoulda-matcher gem
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:pages) }
    it { should validate_presence_of(:year) }
    # Note here validate has no S, but in the model we use validateS
  end
  describe 'Relationship' do
    it { should have_many(:book_authors) }
    it { should have_many(:reviews) }
    it { should have_many(:authors).through(:book_authors) }
  end
  describe 'Sorting' do
    it 'sorts by avg_rating' do

      user_3 = User.create(name: "Wade Wilson")
      user_9 = User.create(name: "Facundo Gracia")
      user_5 = User.create(name: "Son Goku")

      book_8 = Book.create(title: "Game Of Thrones", pages: 604, year: 1996)
      author_6 = book_8.authors.create(name: "George R. R. Martin")
      user_8 = User.create(name: "Melanie Carton")
      review_12 = user_8.reviews.create(title: "Excellent", description: "a really good epic fantasy book, everyone dies", score: 5, book: book_8)

      book_10 = author_6.books.create(title: "A Storm Of Swords", pages: 973, year: 2000)
      user_10 = User.create(name: "Neyla Gracia")
      review_16  = user_10.reviews.create(title: "Very Good", description: "Great expantion of the plot", score: 4, book: book_10)

      review_17 = user_3.reviews.create(title: "My Type Of Book", description: "Hey Facundo read the chapter 43 The red wedding you are goin ot love it", score: 5, book: book_10)

      review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

      review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)


      expect(Book.all).to eq([book_8, book_10])

      expect(Book.do_sort('avg_rating', 'DESC')).to eq([book_8, book_10])
      expect(Book.do_sort('avg_rating', 'ASC')).to eq([book_10, book_8])
      expect(Book.do_sort('pages', 'DESC')).to eq([book_10, book_8])
      expect(Book.do_sort('pages', 'ASC')).to eq([book_8, book_10])
      expect(Book.do_sort('review_count', 'DESC')).to eq([book_10, book_8])
      expect(Book.do_sort('review_count', 'ASC')).to eq([book_8, book_10])
    end
  end
 end
