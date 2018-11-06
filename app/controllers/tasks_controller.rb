class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    
  end

  def create
    @task = Task.find(params[:id])
    @task.create(task_params)
    redirect_to @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id]).destroy
     redirect_to @tasks
  end
  
  private
  def task_params
    params.require(:task).permit(:content)
  end
end
