class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @host = @booking.host
    @activity = @booking.activity
    @date = @booking.date

  end

  def index
    @bookings = Booking.all
  end
end
