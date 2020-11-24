class ProjectCard::Component < ViewComponent::Base
  with_collection_parameter :project

  def initialize(project:)
    @project = project
  end

  def created_at_formatted
    @project.created_at.strftime('%d/%m/%Y')
  end
end
