require 'rails_helper'

describe 'author links direct to author show page' do
  it 'should go to author show when author name is clicked' do

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

    review_1000 = dune.reviews.create(title: "Great", description: "An instant classic.", score: 5, user: user_3)

    review_2000 = farenheit.reviews.create(title: "Great", description: "An instant classic.", score: 5, user: user_3)

    review_3000 = fragile_things.reviews.create(title: "Great", description: "An instant classic.", score: 5, user: user_3)

    visit books_path

    within "#book-1" do
      click_on "#{frank.name}"
    end

    expect(current_path).to eq(author_path(frank))

    within(".author_show_header") do
      expect(page).to have_content(frank.name)
    end

    visit book_path(farenheit)

    within ".book_show_header" do
      click_on "#{ray.name}"
    end

    expect(current_path).to eq(author_path(ray))

    visit author_path(neil)

    within ".author_book_card" do
      click_on "#{terry.name}"
    end

    expect(current_path).to eq(author_path(terry))

  end
end
