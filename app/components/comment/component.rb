# frozen_string_literal: true

class Comment::Component < ViewComponent::Base
  with_collection_parameter :comment

  def initialize(comment:, current_user: nil)
    @comment = comment
    @current_user = current_user
  end

  def user
    @comment.user
  end

  def created_ago
    time_ago_in_words(@comment.created_at)
  end

  def my_comment?
    user == @current_user
  end
end
