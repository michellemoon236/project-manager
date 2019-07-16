class ProjectsController < ApplicationController
  def index
    @projects = Project.all.select { |project| project.users.include?(current_user) }
  end
  
  def new
    @project = Project.new 
    8.times do 
      @project.tasks.build
    end
  end

  def create 
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit 
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    binding.pry
    @project.update(project_params)
    if @project.save
      redirect_to @project 
    else
      render :edit 
    end
  end
  
  private

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      tasks_attributes:[:content, :complete, :project_id, :id],
      user_ids:[]
    )
  end

end
