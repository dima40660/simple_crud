class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks.all
    respond_to do |format|
      format.html{ render 'tasks/index' }
      format.json{ render :json => {tasks: @tasks}}
    end
  end

  def create
    current_user.tasks.create(task_create_params)
    redirect_to '/'
  end

  def edit
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to '/'
    end
  end

  def update
    task = current_user.tasks.find_by(id: params[:id])
    if task && params[:task]
      task.update!(task_update_params)
    end
    redirect_to '/'
  end

  def delete
    task = current_user.tasks.find_by(id: params[:id])
    if task
      task.destroy!
    end
    redirect_to '/'
  end

  def task_create_params
    params.require(:task).permit(:name, :description, :expiry, :importance)
  end

  def task_update_params
    params.require(:task).permit(:name, :description, :expiry, :importance)
  end
end
