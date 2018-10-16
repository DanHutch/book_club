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

    within ".stats_box" do
      expect(all('.best_books')[0]).to have_content('Game Of Thrones')
      expect(all('.best_books')[1]).to have_content('A Storm Of Swords')

      expect(all('.worst_books')[0]).to have_content('A Storm Of Swords')
      expect(all('.worst_books')[1]).to have_content('Game Of Thrones')

      expect(all('.top_reviewers')[0]).to have_content("Son Goku")
      expect(all('.top_reviewers')[1]).to have_content("Facundo Gracia")
      expect(all('.top_reviewers')[2]).to have_content("Wade Wilson")
    end

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

    within "#book-#{book_10.id}" do
      expect(page).to have_content(book_10.title)
      expect(page).to have_content(book_10.authors.name)
      expect(page).to have_content("Pages: #{book_10.pages}")
      expect(page).to have_content("Year: #{book_10.year}")
      expect(page).to have_content("Average Rating: #{book_10.avg_rating}")
      expect(page).to have_content("Based on #{book_10.review_count} review(s)")
    end
  end

  it "user can see all books sorted" do

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

    review_18 = user_9.reviews.create(title: "Bad Bad Bad", description: "this is so bad. So much death. It hurts", score: 1, book: book_10)

    review_19 = user_5.reviews.create(title: "Strong Content", description: "Good book, lot's of plots lines. It's okay", score: 5, book: book_10)

    visit "/books?sorting=avg_rating&direction=DESC"

    expect(all('.book_card')[0]).to have_content('Game Of Thrones')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[1]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_10.pages}")

    visit '/books?sorting=avg_rating&direction=ASC'

    expect(all('.book_card')[1]).to have_content('Game Of Thrones')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[0]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_10.pages}")

    visit '/books?sorting=pages&direction=ASC'

    expect(all('.book_card')[0]).to have_content('Game Of Thrones')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[1]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_10.pages}")

    visit '/books?sorting=pages&direction=DESC'

    expect(all('.book_card')[1]).to have_content('Game Of Thrones')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[0]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_10.pages}")

    visit '/books?sorting=review_count&direction=DESC'

    expect(all('.book_card')[1]).to have_content('Game Of Thrones')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[0]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_10.pages}")

    visit '/books?sorting=review_count&direction=ASC'

    expect(all('.book_card')[0]).to have_content('Game Of Thrones')
    expect(all('.book_card')[0]).to have_content("Pages: #{book_8.pages}")
    expect(all('.book_card')[1]).to have_content('A Storm Of Swords')
    expect(all('.book_card')[1]).to have_content("Pages: #{book_10.pages}")

  end
end
