class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create! project_params
    flash[:notice] = "Project created successfully"
    redirect_to projects_url
  end

  def show
    @project = Project.friendly.find(params[:id])
    @repo_info = Octokit.repo(@project.repo_id)
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])
    @project.update(project_params)
    flash[:notice] = "Successfully updated project"
    redirect_to @project
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    @project.destroy
    flash[:notice] = "Successfully deleted project"
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:description, :repo_id, :name)
  end
end
