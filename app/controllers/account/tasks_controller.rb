module Account
  class TasksController < ApplicationController

    before_action :authenticate_user!

    def index
      @tasks = policy_scope(Task)

      # if @flats.where(:city)
    end

    def edit
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find(params[:id])
      @task.update(task_params)
      redirect_to account_tasks_path
    end

    def new
      @task = Task.new
      authorize @task
    end

    def create
      @task = current_user.tasks.new(task_params)
      if @task.save
        redirect_to task_path(@task)
      else
        render :new
      end
      authorize @task
    end

    private

    def task_params
      params.require(:task).permit(:title, :description, :price, :address, :picture)
    end
  end
end