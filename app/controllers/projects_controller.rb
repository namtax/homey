class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new 
    @project = Project.new
  end

  def create
    @project = Project.new(valid_params.merge(user_id: User.last.id))

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "#{@project.name} created successfully" }
      end
    end
  end

  def show 
    @project = Project.find(params[:id])
  end

  private 
  def valid_params
    params.require(:project).permit(:name)
  end
end