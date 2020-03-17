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

  def new
    @activity = Activity.find(params[:activity_id])
    @host = @activity.host
    @user = User.find(params[:user_id])
    @date = Date.today
    @booking = Booking.new(activity: @activity, host: @host, user: @user, date: @date)
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @host = @activity.host
    @user = User.find(params[:user_id])
    @date = Date.today
    @booking = Booking.new(activity: @activity, host: @host, user: @user, date: @date)
    if @booking.save
      redirect_to user_bookings_path(@user)
    end
  end

  def destroy

  end
end
