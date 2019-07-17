class TasksController < ApplicationController

  def new
    @task = Task.new(project_id: params[:project_id])
  end

  def create 
    @task = Task.create(task_params)
    redirect_to project_path(@task.project_id)
  end

  def task_complete
    @task = Task.find(params[:task][:id])
    @task.complete = true
    @task.save
    redirect_to project_path(id: @task.project_id)
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
    if @task.save
      redirect_to @task.project
    else
      render :edit 
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to @task.project
  end

  private

  def task_params
    params.require(:task).permit(:content, :project_id, :id)
  end
end
