class AvailableDatesController < ApplicationController
  def index
    @host = current_host
    @available_dates = @host.available_dates
    @bookings = @host.bookings
  end
  def new
  end
  def create
    @host = current_host
    @dates = params[:host]["dates"].split(",")
    @host.available_dates.where("date > ?", @dates.first).destroy_all
    @dates.each do |date|
      AvailableDate.create(date: date, host: @host)
    end

    redirect_to host_path(@host)
  end
  def destroy
  end

end
