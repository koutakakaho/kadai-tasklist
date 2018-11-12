class TasksController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_tasks_url
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to tasks_url
  end
  
  private
  def task_params
    params.require(:task).permit(:content, :status,:user_id)
  end
  
  def correct_user
    @task=current_user.tasks.find_by(id: params[:id])
    unless @task
    flash[:danger]="投稿者でないと操作できません"
      redirect_to tasks_url
    end
  end
  
end
