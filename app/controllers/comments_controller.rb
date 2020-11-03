class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    if @comment.errors.any?
      render partial: 'shared/errors', locals: { resource: @comment }, status: :unprocessable_entity
    else
      render @comment
    end
  end

  private

  def project
    @project ||= current_user.collaborations.friendly.find(params[:project_id])
  end

  def set_task
    @task = project.tasks.friendly.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
