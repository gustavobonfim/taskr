class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(tasks_params)
    @task = current_user.tasks.new(tasks_params)
    if @task.save
      flash[:success] = "Task successfully created!"
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def index
    # @tasks = Task.all
    @tasks = current_user.tasks
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      flash[:success] = "Task updated successfully"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Task successfully deleted"
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:content)
  end

end
