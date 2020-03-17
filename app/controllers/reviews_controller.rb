class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:booking_id])
    @review.user = @user
    @review.booking = @booking
    @review.save

    redirect_to(activity_path(@booking.activity))
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
