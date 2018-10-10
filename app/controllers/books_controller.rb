class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new

  end

  def create
    Book.create(params[:book])
  end
end
