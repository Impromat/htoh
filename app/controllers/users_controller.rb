class UsersController < ApplicationController

  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def profile
    @user = User.find(params[:user_id])
    authorize @user
    @tasks = @user.tasks
    @bookings = Booking.where(user_id: current_user.id)

    # @tasks_ids = @tasks.map { |task| task.id }
    # @answers = Booking.where(task_id: @tasks_ids)
  end

  def update
    current_user = User.find(:id)
    current_user.update(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :picture, :email, :password)
    end
end
