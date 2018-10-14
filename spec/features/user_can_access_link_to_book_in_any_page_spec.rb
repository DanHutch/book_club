require 'rails_helper'

describe "User can link to the book clicking the titke in all pages " do
  it "should link books by title in index page" do
    frank = Author.create(name: "Frank Herbert")
    dune = frank.books.create(title: "Dune", pages: 4123, year: 1965)
    ray = Author.create(name: "Ray Bradbury")
    farenheit = ray.books.create(title: "Farenheit 451", pages: 158, year: 1953)
    neil = Author.create(name: "Neil Gaiman")
    terry = Author.create(name: "Terry Pratchett")
    fragile_things = Book.create(title: "Good Omens", pages: 288, year: 1990, authors: [neil, terry])

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

    review_170 = user_3.reviews.create(title: "My Type Of Book", description: "Hey Facundo read the chapter 43 The red wedding you are goin ot love it", score: 5, book: book_10)

    review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)
    review_180 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)
    review_181 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

    review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    review_190 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    review_191 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    review_192 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)


    visit "/books"

    expect(page).to have_content("Books")

    within "#book-#{dune.id}" do
      click_link('dune.title')
    end

    expect(current_path).to eq("/books/#{dune.id}")

    within ".book_show_header" do
      expect(page).to have_content(dune.title)
      expect(page).to have_content(dune.authors.name)
      expect(page).to have_content("Pages: #{dune.pages}")
      expect(page).to have_content("Year: #{dune.year}")
    end

    visit "/books"

    within "#book-#{farenheit.id}" do
      click_link('farenheit.title')
    end

    expect(current_path).to eq("/books/#{farenheit.id}")

    within ".book_show_header" do
      expect(page).to have_content(farenheit.title)
      expect(page).to have_content(farenheit.authors.name)
      expect(page).to have_content("Pages: #{farenheit.pages}")
      expect(page).to have_content("Year: #{farenheit.year}")
    end

    visit "/books"

    within "#book-#{fragile_things.id}" do
      click_link('fragile_things.title')
    end

    expect(current_path).to eq("/books/#{fragile_things.id}")

    within ".book_show_header" do
      expect(page).to have_content(fragile_things.title)
      expect(page).to have_content(fragile_things.authors.name)
      expect(page).to have_content("Pages: #{fragile_things.pages}")
      expect(page).to have_content("Year: #{fragile_things.year}")
    end

    visit "/books"

    within "#book-#{book_10.id}" do
      click_link('book_10.title')
    end

    expect(current_path).to eq("/books/#{book_10.id}")

    within ".book_show_header" do
      expect(page).to have_content(book_10.title)
      expect(page).to have_content(book_10.authors.name)
      expect(page).to have_content("Pages: #{book_10.pages}")
      expect(page).to have_content("Year: #{book_10.year}")
    end
  end
end
