class ReviewsController < ApplicationController

  def new
    @review = Review.new()
    redirect_to '/reviews/new'
  end

  def create

  end


end
