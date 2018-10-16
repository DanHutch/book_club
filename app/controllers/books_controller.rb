class BooksController < ApplicationController

  def index
    if params[:sorting]
      @books = Book.do_sort(params[:sorting], params[:direction])
    else
      @books = Book.all
    end
    @best_rated_books = Book.show_3_by_rating('DESC')
    @worst_rated_books = Book.show_3_by_rating('ASC')
    @top_reviewers = User.top_3
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def create
    params_hash = book_params
    params_hash[:title] = params_hash[:title].titlecase
    data =  Author.authors_by_book(params_hash)
    @book = Book.create(params_hash)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

# This block should be last in the controller
  private

  def book_params
    params.require(:book).permit(:title, :pages, :year, :authors)
  end
end
