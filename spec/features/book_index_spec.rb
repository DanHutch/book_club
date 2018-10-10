require 'rails_helper'

describe "Book_index" do
  it "user_can_see_all_books" do
    frank = Author.create(name: "Frank Herbert")
    dune = frank.books.create(title: "Dune", pages: 4123, year: 1965)
    ray = Author.create(name: "Ray Bradbury")
    farenheit = ray.books.create(title: "Farenheit 451", pages: 158, year: 1953)
    neil = Author.create(name: "Neil Gaiman")
    terry = Author.create(name: "Terry Pratchett")
    fragile_things = Book.create(title: "Good Omens", pages: 288, year: 1990, authors: [neil, terry])


    visit "/books"

    expect(page).to have_content("Books")

    within "#book-#{dune.id}" do
      expect(page).to have_content(dune.title)
      expect(page).to have_content(dune.authors.name)
      expect(page).to have_content("Pages: #{dune.pages}")
      expect(page).to have_content("Year: #{dune.year}")
    end

    within "#book-#{farenheit.id}" do
      expect(page).to have_content(farenheit.title)
      expect(page).to have_content(farenheit.authors.name)
      expect(page).to have_content("Pages: #{farenheit.pages}")
      expect(page).to have_content("Year: #{farenheit.year}")
    end

    within "#book-#{fragile_things.id}" do
      expect(page).to have_content(fragile_things.title)
      expect(page).to have_content(fragile_things.authors.name)
      expect(page).to have_content("Pages: #{fragile_things.pages}")
      expect(page).to have_content("Year: #{fragile_things.year}")
    end
  end
end
