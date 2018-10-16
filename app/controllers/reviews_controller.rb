class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new()
  end

  def create
    @user = User.find_or_create_by(name: review_params[:user])
    @book = Book.find(params[:book_id])
    binding.pry
      if @book.reviews.user.where(user_id: @user.id).empty?

      end
  end

  private

  def review_params
    params.require(:review).permit(:user, :title, :description, :score, :book_id)
  end
end
