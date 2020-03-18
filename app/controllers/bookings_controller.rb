class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @user = @booking.user
    @host = @booking.host
    @activity = @booking.activity
    @date = @booking.date

  end

  def index
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @host = @activity.host
    @user = User.find(params[:user_id])
    @date = Date.parse(params[:booking]["date"])
    @group_size = params[:booking]["group_size"]
    @booking = Booking.new(activity: @activity, host: @host, user: @user, date: @date, group_size: @group_size)
    if @booking.save
      redirect_to user_bookings_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@user.id)
  end
end
