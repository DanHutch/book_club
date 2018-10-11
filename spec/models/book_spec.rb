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
  describe 'Create new book with title and authors name titlecase' do
    it 'Should create new book with titlecase for title and authors name' do
      neil = Author.create(name: "Neil Gaiman")
      terry = "terry pratchett"
      book = Book.create_new(title: "good omens", pages: 288, year: 1990, authors: [neil, terry])

      expect(book.title).to eq("Good Omens")
      expect(book.authors.first.name).to eq("Neil Gaiman")
      expect(book.authors.last.name).to eq("Terry Pratchett")
    end
    it 'should not create an author if it exists in database' do
      neil = Author.create(name: "Neil Gaiman")
      real_terry = Author.create(name: "Terry Pratchett")
      terry = "terry pratchett"
      book = Book.create_new(title: "good omens", pages: 288, year: 1990, authors: [neil, terry])

      expect(book.title).to eq("Good Omens")
      expect(book.authors.first.name).to eq("Neil Gaiman")
      expect(book.authors.last.name).to eq("Terry Pratchett")
      binding.pry
      expect(book.authors.where(name: "Terry Pratchett").count).to eq(1)
    end

  end

end
