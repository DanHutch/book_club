class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if params[:sorting]
      @reviews = @user.sort_reviews(params[:sorting], params[:direction])
    else @reviews = @user.reviews
    end
  end

end
