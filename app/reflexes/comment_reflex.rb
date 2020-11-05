# frozen_string_literal: true

class CommentReflex < ApplicationReflex
  delegate :current_user, to: :connection
  delegate :render, to: ApplicationController

  def create
    task = Task.friendly.find(params[:id])
    @comment = task.comments.new(comment_params)
    @comment.user = current_user

    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
