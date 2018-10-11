class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new

  end

  def create
    Book.create(user_params)
    redirect "/books"
  end

# This block should be last in the class
  private

  def user_params
    params.require(:book).permit(:title, :pages, :year, :authors)
  end
end
