class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      flash[:success] = "Task successfully created!"
      redirect_to tasks_path
    else
      flash[:danger] = "Task not created!"
      render 'new'
    end
  end

  def index
    @tasks = Task.all
  end

  private
  def tasks_params
    params.require(:task).permit(:content)
  end

end
