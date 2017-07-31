class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(tasks_params)
    @task = current_user.tasks.new(tasks_params)
    if @task.save
      flash[:success] = "Task successfully created!"
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def index
    # @tasks = Task.all
    # @tasks = current_user.tasks
    @to_do = current_user.tasks.where(state: 'to_do')
    # @to_do = current_user.tasks.select {|t| t.state == "to_do"}
    @doing = current_user.tasks.where(state: 'doing')
    @done = current_user.tasks.where(state: 'done')
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

  def change
    @task.update_attributes(state: params[:state])
    flash[:success] = "Task was successfully updated"
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:content, :state)
  end

end
