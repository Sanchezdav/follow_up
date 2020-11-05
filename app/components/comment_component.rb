class CommentComponent < ViewComponent::Base
  def initialize(comment:)
    @comment = comment
  end

  def user
    @comment.user
  end
end
