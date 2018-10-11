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

      book_1 = Book.create(title: "The Shadow Of The Wind", pages: 565, year: 2001)
      author_1 = book_1.authors.create(name: "Carlos Ruiz Zafon")
      user_1 = User.create(name: "Nathan Drake")

      book_2 = Book.create(title: "Blindness", pages: 288, year: 1997)
      author_2 = book_2.authors.create(name: "Jose Saramago")
      user_2 = User.create(name: "Pepper Pots")

      

      expect(Book.all).to eq([book_1, book_2])

      expect(Book.sort(avg_rating, DESC)).to eq([book_2, book_1])
      # expect()

      # expect(all('.book_card')[0]).to have_content('Pages: ')

    end
  end
 end
