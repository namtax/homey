class CommentsController < ApplicationController
  def create
    project  = Project.find(params[:project_id])
    comment  = project.comments.build(valid_params.merge(user_id: User.last.id))

    respond_to do |format|
      if comment.save
        format.html { redirect_to project_path(project), notice: "Comment created successfully" }
      end
    end
    
  end

  private

  def valid_params
    params.require(:comment).permit(:body)
  end
end
