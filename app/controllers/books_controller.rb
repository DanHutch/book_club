class BooksController < ApplicationController

  def index
    # if params[:sorting]
    #   @books = Book.order(params[:sorting], params[:direction])
    # else
      @books = Book.all
    # end
  end

end
