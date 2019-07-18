class ProjectsController < ApplicationController
  before_action :require_login

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
    binding.pry
    @project = Project.new(project_params)
    binding.pry
    @project.user_projects.each do |user_project|
      user_project.project_creator = true if user_project.user_id == current_user.id
    end
    binding.pry
    if @project.save
      binding.pry
      redirect_to project_path(@project)
    else
      binding.pry
      flash[:error] = @project.errors.full_messages
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
    @project.update(project_params)
    if @project.save
      redirect_to @project 
    else
      flash[:error] = @project.errors.full_messages
      render :edit 
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
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

  def require_login
    return head(:forbidden) unless user_signed_in?
  end

end
