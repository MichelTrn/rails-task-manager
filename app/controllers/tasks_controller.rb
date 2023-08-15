class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to task_path(@task)
  end

  # def edit
  #   @task = Task.find(params[:id])
  # end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError

    # No need for app/views/restaurants/update.html.erb mais accéder à la vue de
    # notre task qui a été modifié
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
