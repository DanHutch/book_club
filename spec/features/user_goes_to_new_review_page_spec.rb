require 'rails_helper'

describe "user_go_to_new_review_page_and_create_a_new_review" do
  it "should go and create a review" do
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

    visit "/books/#{book_8.id}"

    book_review = "game of thrones"
    book_description = "It's a really bloody story"
    user_name = "Megan Miles"

    within('.new_review') do
      click_link('Click Here To Add A New Review')
    end

    expect(current_path).to eq('/reviews/new')

    within('.new_review') do
      fill_in 'review[user]', with: user_name
      fill_in 'review[title]', with: book_review
      fill_in 'review[description]', with: book_description
      fill_in 'review[score]', with: 5
      click_button 'Create Review'
    end

    new_review = Review.last

    expect(current_path).to eq("/books/#{book_8.id}")

    within("#review") do

      expect(page).to have_content(User.last.name)
      expect(page).to have_content(book_8.title)
      expect(page).to_not have_content(book_10.title)
      expect(page).to have_content(new_review.title)
      expect(page).to have_content(new_review.description)
      expect(page).to have_content(review_10.title)
      expect(page).to have_content(review_10.description)
      expect(page).to have_content(review_10.score)
      expect(review_10.score).to shoul_be_between(1,5)
    end

  end
end
