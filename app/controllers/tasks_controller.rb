class TasksController < ApplicationController

  def task_complete
    @task = Task.find(params[:task][:id])
    @task.complete = true
    @task.save
    redirect_to project_path(id: @task.project_id)
  end
end
