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
    @bookings = @user.bookings.sort {|a, b| a.date <=> b.date }
  end

  def new
    @activity = Activity.find(params[:activity_id])
    @user = User.find(params[:user_id])
    @host_availability = @activity.host.available_dates
    @host = @activity.host
    @booking = Booking.new
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @host = @activity.host
    @user = User.find(params[:user_id])
    @date = Date.parse(params[:booking]["date"])
    @group_size = params[:booking]["group_size"]
    @host_availability = @activity.host.available_dates
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
    if current_user
      redirect_to user_bookings_path(@user)
    else
      redirect_to host_path(current_host)
    end
  end
end
