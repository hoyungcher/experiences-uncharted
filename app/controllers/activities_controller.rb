class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @host = Host.find(params[:host_id])
    @activity.host = @host
    if @activity.save
      redirect_to host_path(@host)
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :location, :price_per_day, :description)
  end
end
