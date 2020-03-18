class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    @tags = Tag.all
    @unshow_banner = false
    @cities = Activity.select(:city).map(&:city).uniq

  end

  def show
    @activity = Activity.find(params[:id])
    @reviews = @activity.reviews.all
  end

  def new
    @activity = Activity.new
    @host = Host.find(params[:host_id])
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
    params.require(:activity).permit(:name, :city, :price_per_person, :description, :address, :max_group_size, :duration)
  end
end
