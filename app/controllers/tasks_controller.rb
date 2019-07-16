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

  def task_params
    params.require(:task).permit(:content, :project_id)
  end
end
