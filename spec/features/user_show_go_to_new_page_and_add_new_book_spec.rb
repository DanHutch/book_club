require 'rails_helper'

describe "user_go_to_new_page_and_create_a_new_book" do
  it "should go and create a new book" do
    frank = Author.create(name: "Frank Herbert")
    dune = frank.books.create(title: "Dune", pages: 4123, year: 1965)
    ray = Author.create(name: "Ray Bradbury")
    farenheit = ray.books.create(title: "Farenheit 451", pages: 158, year: 1953)
    neil = Author.create(name: "Neil Gaiman")
    terry = Author.create(name: "Terry Pratchett")
    fragile_things = Book.create(title: "Good Omens", pages: 288, year: 1990, authors: [neil, terry])

    visit new_book_path

    book_title = "game of thrones"
    authors = "george r. r. martin, vago de al lado"

    within('.new_book') do
      fill_in 'book[title]', with: book_title
      fill_in 'book[pages]', with: 604
      fill_in 'book[year]', with: 1996
      fill_in 'book[authors]', with: authors
      click_button 'Create Book'
    end

    expect(current_path).to eq(books_path)

    new_book = Book.last
    within("#book-#{new_book.id}") do
      expect(page).to have_content(book_title.titlecase)
      expect(page).to have_content(new_book.pages)
      expect(page).to have_content(new_book.year)
      expect(page).to_not have_content(authors)
      expect(page).to have_content(new_book.authors.first.name)
      expect(page).to have_content(new_book.authors.last.name)
    end

  end
end
