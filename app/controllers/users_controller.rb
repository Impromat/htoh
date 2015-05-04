class UsersController < ApplicationController

  def profile
    @user = User.find(params[:user_id])
    authorize @user
    @answers = @user.bookings
    @tasks = @user.tasks
  end

end
