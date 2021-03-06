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
    @unshow_activity_footer = false
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

  def edit
    @host = current_host
    @activity = Activity.find(params[:id])
  end

  def update
    @host = current_host
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to host_path(@host)
  end

  def destroy
    @host = current_host
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to host_path(@host)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :city, :price_per_person, :description, :address, :max_group_size, :duration)
  end
end
