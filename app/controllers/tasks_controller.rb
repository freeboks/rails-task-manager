class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

# CREATE
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      # take you to show page and show the task you've made
      redirect_to task_path(task)
    else
      render :new
    end
  end

# UPDATE
  def edit
  end

  def update
    # task_params are task object
    @task.update(task_params)
    if params["task"]["completed"].to_i == 1
      @task.completed = true
    end
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path if @task.destroy
  end

private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
