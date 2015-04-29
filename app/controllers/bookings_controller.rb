class BookingsController < ApplicationController

  def index

  end

  def new
    @task = Task.find(params[:task_id])
    @booking = Booking.new
  end

  def create
    @task = Task.find(params[:task_id])
    @booking = @task.bookings.new(booking_params)
    if @booking.save
      @booking.update(user_id: current_user.id)
      redirect_to root_path
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
    params.require(:booking).permit(:date)
  end
end


