class HostsController < ApplicationController
  def show
    @host = Host.find(params[:id])
    @bookings = @host.bookings.sort {|a,b| a.date <=> b.date }.select {|a| a.date > Date.today }
    @past_bookings = @host.bookings.sort {|a,b| b.date <=> a.date }
  end
end
