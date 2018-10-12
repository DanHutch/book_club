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

end
