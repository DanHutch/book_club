require 'rails_helper'

describe "user show page" do

  before(:each) do
    @user = User.create(name: "Dan Review")
    @author_1 = Author.create(name: "First Author")
    @book_1 = @author_1.books.create(title: "First Book", pages: 100, year: 2000)
    @review_1 = @user.reviews.create(title: "Bad Book", book: @book_1, score: 1, description: "I did not like this.")
    @book_2 = @author_1.books.create(title: "Second Book", pages: 200, year:2010)
    @review_2 = @user.reviews.create(title: "Better Than The Last One", book: @book_2, score: 3, description: "I liked this book more.")

  end

  it "visitor should see all reviews and their data for that user" do
    visit user_path(@user)

    expect(page).to have_content(@user.name)

    expect(page).to have_content(@user.reviews.first.title)
    expect(page).to have_content(@user.reviews.first.score)
    expect(page).to have_content(@user.reviews.first.description)

    expect(page).to have_content(@user.reviews.last.title)
    expect(page).to have_content(@user.reviews.last.score)
    expect(page).to have_content(@user.reviews.last.description)
  end

  it "visitor should be able to click to sort reviews by age" do
    visit user_path(@user)

    expect(page).to have_content("Sort Reviews: Newest-First / Oldest-First")

    click_on "Newest-First"

    expect(all('.review')[0]).to have_content(@review_2.title)

    expect(all('.review')[0]).to_not have_content(@review_1.title)

    click_on "Oldest-First"

    expect(all('.review')[0]).to have_content(@review_1.title)

    expect(all('.review')[0]).to_not have_content(@review_2.title)

  end
end
