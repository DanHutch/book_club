require 'rails_helper'

describe "Book_show" do
  it "user_can_see_single_book_with_all_details" do

    author_6 = Author.create(name: "George R. R. Martin")

    book_10 = author_6.books.create(title: "A Storm Of Swords", pages: 973, year: 2000)

    user_10 = User.create(name: "Neyla Gracia")
    user_3 = User.create(name: "Wade Wilson")
    user_5 = User.create(name: "Son Goku")
    user_9 = User.create(name: "Facundo Gracia")


    review_16  = user_10.reviews.create(title: "Very Good", description: "Great expantion of the plot", score: 4, book: book_10)

    review_17 = user_3.reviews.create(title: "My Type Of Book", description: "Hey Facundo read the chapter 43 The red wedding you are goin ot love it", score: 5, book: book_10)

    review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

    review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    visit book_path(book_10)

    within ".book_show_header" do
      expect(page).to have_content("#{book_10.title}")
      book_10.authors.each do |author|
        expect(page).to have_content(author.name)
      end
      expect(page).to have_content("Pages: #{book_10.pages}")
    end

    within ".reviews_block" do
      book_10.reviews.each do |rev|
        expect(page).to have_content(rev.title)
        expect(page).to have_content(rev.user.name)
        expect(page).to have_content(rev.score)
        expect(page).to have_content(rev.description)
      end
    end

    within ".book_show_stats" do
      expect(page).to have_content(book_10.avg_rating)
      within ".top_3_reviews" do
        book_10.top_3_reviews.each do |rev|
          expect(page).to have_content(rev.title)
          expect(page).to have_content(rev.user.name)
          expect(page).to have_content(rev.score)
        end
      end
      within ".bottom_3_reviews" do
        book_10.bottom_3_reviews.each do |rev|
          expect(page).to have_content(rev.title)
          expect(page).to have_content(rev.user.name)
          expect(page).to have_content(rev.score)
        end
      end
    end

  end

  it "user can click a link to delete book" do
    author_6 = Author.create(name: "George R. R. Martin")

    book_10 = author_6.books.create(title: "A Storm Of Swords", pages: 973, year: 2000)

    user_10 = User.create(name: "Neyla Gracia")
    user_3 = User.create(name: "Wade Wilson")
    user_5 = User.create(name: "Son Goku")
    user_9 = User.create(name: "Facundo Gracia")


    review_16  = user_10.reviews.create(title: "Very Good", description: "Great expantion of the plot", score: 4, book: book_10)

    review_17 = user_3.reviews.create(title: "My Type Of Book", description: "Hey Facundo read the chapter 43 The red wedding you are goin ot love it", score: 5, book: book_10)

    review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

    review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    visit book_path(book_10)

    click_on "Delete Book"

    expect(current_path).to eq(books_path)

    expect(page).to_not have_content(book_10.title)

  end
end
