class BookingsController < ApplicationController

  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @task = Task.find(params[:task_id])
    @booking = Booking.new
  end

  def create
    @task = Task.find(params[:task_id])
    @booking = @task.bookings.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update_attributes(update_booking_params)
    redirect_to :back
  end

  private

  def update_booking_params
    params.require(:booking).permit(:accepted)
  end

  def booking_params
    params.require(:booking).permit(:description)
  end
end


