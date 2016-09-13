class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.user = current_user
    if @project.save
      flash[:notice] = "Project created successfully"
      redirect_to projects_url
    else
      render 'new'
    end
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
    if current_user == @project.user
      @project.update(project_params)
      flash[:notice] = "Successfully updated project"
      redirect_to @project
    else
      redirect_to root_path
      flash[:notice] = 'You can only edit projects you own'
    end
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    if current_user == @project.user
      @project.destroy
      flash[:notice] = "Successfully deleted project"
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = 'You can only delete projects you own'
    end
  end

  private

  def project_params
    params.require(:project).permit(:description, :repo_id, :name)
  end
end
