class TasksController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @tasks = policy_scope(Task)
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  # private

  # def search_params
  #   params.permit(:city, :travellers, :date)
  # end
end
