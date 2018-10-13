require 'rails_helper'
describe Author, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
  describe 'Relationship' do
    it { should have_many(:book_authors) }
    it { should have_many(:books).through(:book_authors) }
  end

  it 'Class Methods' do
    neil = "Neil Gaiman , terry pratchett "
    real_terry = Author.create(name: "Terry Pratchett")
    hash = Hash.new(' ')
    hash[:authors] =  neil
    authors = Author.authors_by_book(hash)

    expect(authors.first.name).to eq("Neil Gaiman")
    expect(authors.last.name).to eq("Terry Pratchett")
    expect(authors.last.id).to eq(real_terry.id)
    end
 end
