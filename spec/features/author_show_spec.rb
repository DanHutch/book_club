require 'rails_helper'

describe "author_show" do
  it "user_can_see_single_author_with_all_details" do

    author = Author.create(name: "Dan Writer")
    author_2 = Author.create(name: "Some Person")

    book_1 = Book.create(title: "Dan's First Book", pages: 500, year: 2018, authors: [author, author_2])

    book_2 = Book.create(title: "Dan's second Book", pages: 100, year: 2017, authors: [author])


    visit "authors/#{author.id}"

      expect(page).to have_content("#{author.name}")

      within '.author_book_list' do
        expect(all('.author_book_card')[0]).to have_content("#{book_1.title}")
        expect(all('.author_book_card')[0]).to have_content("#{book_1.pages}")
        expect(all('.author_book_card')[0]).to have_content("#{author_2.name}")

        expect(all('.author_book_card')[1]).to have_content("#{book_2.title}")
        expect(all('.author_book_card')[1]).to have_content("#{book_2.pages}")

      end

  end
end
