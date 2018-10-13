class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new

  end

  def create
    params_hash =  Author.authors_by_book(user_params(params))
    Book.create_book(params_hash)
    redirect_to "/books"

    # authors = Author.authors_by_book(user_params(params))
    # Book.create_book(authors)

  end

# This block should be last in the controller
  private

  def user_params(params)
    params.require(:book).permit(:title, :pages, :year, :authors)
  end
end
