class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new()
  end

  def create
    params_hash = user_params(params)
    params_hash[:title] = params_hash[:title].titlecase
    data =  Author.authors_by_book(params_hash)
    @book = Book.create(params_hash)
    redirect_to "/books"
  end

# This block should be last in the controller
  private

  def user_params(params)
    params.require(:book).permit(:title, :pages, :year, :authors)
  end
end
