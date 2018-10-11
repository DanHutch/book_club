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
  # decribre 'Create new book with title and authors name titlecase' do
  #   it 'Should create new book with titlecase for title and authors name' do
  #     neil = Author.create(name: "Neil Gaiman")
  #     terry = Author.create(name: "Terry Pratchett")
  #     fragile_things = Book.create(title: "Good Omens", pages: 288, year: 1990, authors: [neil, terry])
  #
  #   end
  # end

end
