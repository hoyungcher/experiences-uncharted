class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
  end
end
