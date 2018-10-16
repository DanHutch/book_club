class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new()
  end

  def create
    @user = User.find_or_create_by(name: review_params[:user])
    @book = Book.find(params[:book_id])
    hash = review_params
    hash[:user] = @user
    @review = @book.reviews.create(hash)
    redirect_to book_path(@book)
  end

  private

  def review_params
    params.require(:review).permit(:user, :title, :description, :score, :book_id)
  end
end
