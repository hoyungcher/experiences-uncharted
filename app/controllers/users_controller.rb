class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password)
  end
end
