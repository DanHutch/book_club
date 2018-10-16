require 'rails_helper'

describe "author_show" do
  it "user_can_see_single_author_with_all_details" do

    author = Author.create(name: "Dan Writer")
    author_2 = Author.create(name: "Some Person")

    book_1 = Book.create(title: "Dan's First Book", pages: 500, year: 2018, authors: [author, author_2])

    book_2 = Book.create(title: "Dan's second Book", pages: 100, year: 2017, authors: [author])

    user_1 = User.create(name: "Review Master")
    user_2 = User.create(name: "Your Mom")

    review_1 = user_1.reviews.create(title: "These Tests Are Gonna Pass", description: "I've got a great feeling about this!", score: 5, book: book_1)
    review_2 = user_2.reviews.create(title: "You Shall Pass", description: "I've got a pretty good feeling about this!", score: 4, book: book_1)

    review_3 = user_1.reviews.create(title: "This is a review", description: "You've got a book.", score: 3, book: book_2)
    review_4 = user_2.reviews.create(title: "Whatevs", description: "blah blah blah", score: 2, book: book_2)


     visit author_path(author)

      expect(page).to have_content("#{author.name}")

      within '.author_book_list' do
        expect(all('.author_book_card')[0]).to have_content("#{book_1.title}")
        expect(all('.author_book_card')[0]).to have_content("#{book_1.pages}")
        expect(all('.author_book_card')[0]).to have_content("#{author_2.name}")
        expect(all('.author_book_card')[0]).to have_content("Top Review: #{review_1.title}")
        expect(all('.author_book_card')[0]).to have_content("Score: #{review_1.score}")
        expect(all('.author_book_card')[0]).to have_content("Reviewed By: #{review_1.user.name}")
        expect(all('.author_book_card')[0]).to_not have_content("Reviewed By: #{review_2.user.name}")

        expect(all('.author_book_card')[1]).to have_content("#{book_2.title}")
        expect(all('.author_book_card')[1]).to have_content("#{book_2.pages}")
        expect(all('.author_book_card')[1]).to have_content("Top Review: #{review_3.title}")
        expect(all('.author_book_card')[1]).to have_content("Score: #{review_3.score}")
        expect(all('.author_book_card')[1]).to have_content("Reviewed By: #{review_3.user.name}")
        expect(all('.author_book_card')[0]).to_not have_content("Top Review: #{review_4.title}")
      end
  end

  it 'user can delete author from show page' do
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

    review_1000 = dune.reviews.create(title: "Great 2", description: "An instant classic.", score: 5, user: user_3)

    review_2000 = farenheit.reviews.create(title: "Great 1", description: "An instant classic.", score: 5, user: user_3)

    review_3000 = fragile_things.reviews.create(title: "Great stuff", description: "An instant classic. By a 1000 time", score: 5, user: user_3)

    visit author_path(frank)

    click_on("Delete Author")

    expect(current_path).to eq(books_path)

    expect(page).to_not have_content(frank.name)
    expect(page).to_not have_content(dune.title)

  end
end
