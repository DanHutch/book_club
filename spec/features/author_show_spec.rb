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


    visit "authors/#{author.id}"

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
end
