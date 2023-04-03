class ProjectsController < ApplicationController
  before_action :authenticate

  def index
    @projects = Project.all
  end

  def new 
    @project = Project.new
  end

  def create
    @project = Project.new(valid_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "#{@project.name} created successfully" }
      end
    end
  end

  def update
    project = Project.find(params[:id])
    project.assign_attributes(valid_params)

    respond_to do |format|
      if project.save
        format.html { redirect_to project_path(project), notice: "#{project.name} updated successfully" }
      end
    end
  end

  def show 
    @project = Project.find(params[:id])
    @history = [*@project.comments, *@project.versions.where.not(object_changes: nil)].sort_by(&:created_at)
  end

  private 
  def valid_params
    params.require(:project).permit(:name, :status)
  end

  def authenticate
    authenticate_user!
  end
end
