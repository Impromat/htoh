class TasksController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]
  after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @tasks = policy_scope(Task)
    @markers = Gmaps4rails.build_markers(@tasks) do |task, marker|
      marker.lat task.latitude
      marker.lng task.longitude
    end
  end

  def show
    @task = Task.find(params[:id])
    @task_coordinates = { lat: @task.latitude, lng: @task.longitude }
    authorize @task
    @booking = Booking.new
    @booking.task = @task
    @booking.user = current_user
  end

  # private

  # def search_params
  #   params.permit(:city, :date)
  # end
end
