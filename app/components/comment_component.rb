class CommentComponent < ViewComponent::Base
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

  def is_my_comment
    user == @current_user
  end
end
