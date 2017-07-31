class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      flash[:success] = "Task successfully created!"
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      flash[:success] = "Task updated successfully"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  private
  def tasks_params
    params.require(:task).permit(:content)
  end

end
