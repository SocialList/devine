class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    flash[:notice] = "Project created successfully"
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:description, :repo_id)
  end
end
