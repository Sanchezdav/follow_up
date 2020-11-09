class ProjectBoardComponent < ViewComponent::Base
  with_collection_parameter :label

  def initialize(label:)
    @label = label
  end
end
