class AvailableDatesController < ApplicationController
  def index
    @host = current_host
    @available_dates = @host.available_dates
  end
  def new
  end
  def create
  end
  def destroy
  end

end
