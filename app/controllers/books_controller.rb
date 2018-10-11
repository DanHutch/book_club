class BooksController < ApplicationController

  def index
    if params[:sorting]
      @books = Book.do_sort(params[:sorting], params[:direction])
    else
      @books = Book.all
    end
  end

end
