class UsersController < ApplicationController

  def profile
    @user = User.find(params[:user_id])
    authorize @user
  end

end
