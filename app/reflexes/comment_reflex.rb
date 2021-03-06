# frozen_string_literal: true

class CommentReflex < ApplicationReflex
  delegate :current_user, to: :connection
  delegate :render, to: ApplicationController

  def create
    task = Task.friendly.find(params[:id])
    @comment = task.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      target_id = "#task-#{task.slug}-comments"
      renderer = ApplicationController.renderer.new(
        http_host: ENV['RAILS_APPLICATION_URL'].presence || 'http://my-domain.com:3000',
        https: Rails.env.production?
      )

      cable_ready['task'].morph(
        selector: target_id,
        children_only: true,
        html: renderer.render(
          Comment::Component.with_collection(task.comments)
        )
      )
      cable_ready.broadcast
    else
      @comment
    end
  end

  def destroy
    comment = Comment.find(element.dataset[:comment_id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
