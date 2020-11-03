class CommentComponent < ViewComponent::Base
  def initialize(comment:)
    @comment = comment
  end
end
